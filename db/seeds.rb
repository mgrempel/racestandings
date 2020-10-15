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
Driver.destroy_all
Season.destroy_all

# API endpoints
drivers_url = "http://ergast.com/api/f1/drivers.json"
seasons_url = "http://ergast.com/api/f1/seasons.json"

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

  # We've gotten the circuits for the current season, we need to check if those circuits exist.
  circuits.each do |circuit|
    current_circuit = Circuit.find_or_create_by(name:      circuit["circuitName"],
                                                circuitid: circuit["circuitId"],
                                                url:       circuit["url"],
                                                locality:  circuit["Location"]["locality"],
                                                country:   circuit["Location"]["country"])
    current_season.circuits << current_circuit
  end
  current_season.save
end

# Populate Circuits

# handle driver data
# driver_data.each do |driver|
#   puts "segment start"
#   puts driver
# end
