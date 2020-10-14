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

# API endpoints
drivers_url = "http://ergast.com/api/f1/drivers.json"
# seasons_URL = "http://ergast.com/api/f1/seasons.json"

driver_uri = URI(drivers_url)
response = Net::HTTP.get(driver_uri)
driver_data = JSON.parse(response)

drivers = driver_data["MRData"]["DriverTable"]["Drivers"]
drivers.each do |driver|
  Driver.create(first_name: driver["givenName"])
end

# handle driver data
# driver_data.each do |driver|
#   puts "segment start"
#   puts driver
# end
