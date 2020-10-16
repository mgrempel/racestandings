class Laptime < ApplicationRecord
  has_one :driver
  has_one :circuit, optional: true
  has_one :season,  optional: true
end
