class Laptime < ApplicationRecord
  has_one :driver
  has_one :circuit, required: false
  has_one :season,  required: false
  validates :laptime, :driver_id, presence: true
end
