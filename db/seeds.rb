# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "net/http"
require "json"

# Wipe the tables
Laptime.destroy_all
Driver.destroy_all
Circuit.destroy_all
Season.destroy_all

# API endpoints
drivers_url = "http://ergast.com/api/f1/drivers.json?limit=1000"
seasons_url = "http://ergast.com/api/f1/seasons.json?limit=71"

# Populate drivers
driver_uri = URI(drivers_url)
response = Net::HTTP.get(driver_uri)
driver_data = JSON.parse(response)

drivers = driver_data["MRData"]["DriverTable"]["Drivers"]
drivers.each do |driver|
  Driver.create(first_name:  driver["givenName"],
                last_name:   driver["familyName"],
                dob:         driver["dateOfBirth"],
                url:         driver["url"],
                nationality: driver["nationality"],
                driverid:    driver["driverId"])
end

# Populate seasons and circuits
season_uri = URI(seasons_url)
season_response = Net::HTTP.get(season_uri)
season_data = JSON.parse(season_response)

seasons = season_data["MRData"]["SeasonTable"]["Seasons"]
seasons.each do |season|
  current_season = Season.new(year: season["season"],
                              url:  season["url"])
  # Now to get the tracks assoiated with each season.

  # API path for courses for the year
  circuit_url = "http://ergast.com/api/f1/#{current_season.year}/circuits.json"
  circuit_uri = URI(circuit_url)
  circuit_response = Net::HTTP.get(circuit_uri)
  circuit_data = JSON.parse(circuit_response)
  circuits = circuit_data["MRData"]["CircuitTable"]["Circuits"]

  # How many rounds do we have?
  rounds = 0

  # We've gotten the circuits for the current season, we need to check if those circuits exist.
  circuits.each do |circuit|
    rounds += 1
    current_circuit = Circuit.find_or_create_by(name:      circuit["circuitName"],
                                                circuitid: circuit["circuitId"],
                                                url:       circuit["url"],
                                                locality:  circuit["Location"]["locality"],
                                                country:   circuit["Location"]["country"])
    current_season.circuits << current_circuit
    # Now let's check the laptimes for each circuit (getting the first lap, API no longer supports best times)
    # times were only recorded after 1996, let's account for that
    puts current_season.year
    next unless current_season.year.to_i >= 1996 && current_season.year.to_i < 2020

    laptime_url = "http://ergast.com/api/f1/#{current_season.year}/#{rounds}/laps/1.json"
    laptime_uri = URI(laptime_url)
    laptime_response = Net::HTTP.get(laptime_uri)
    laptime_data = JSON.parse(laptime_response)
    laptimes = laptime_data["MRData"]["RaceTable"]["Races"][0]["Laps"][0]["Timings"]

    next if laptimes.nil?

    laptimes.each do |laptime|
      racer = Driver.where(driverid: laptime["driverId"]).first
      current_laptime = racer.laptimes.build(laptime: laptime["time"])

      # Associate to Season
      current_season.laptimes << current_laptime
      current_season.save

      # Associate to Circuit
      current_circuit.laptimes << current_laptime
      current_circuit.save

      # Associate to Driver
      racer.save

      # current_laptime.save
      # racer.save
      # current_season.save
      # current_circuit.save
    end
  end
  current_season.round = rounds

  current_season.save
end
