class Laptime < ApplicationRecord
  has_one :driver
  has_one :circuit
end
