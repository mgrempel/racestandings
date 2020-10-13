class Laptime < ApplicationRecord
  has_one :driver
  has_one :circuit
  has_one :season
end
