class Laptime < ApplicationRecord
  belongs_to :driver
  belongs_to :circuit, optional: true
  belongs_to :season,  optional: true
  validates :laptime, :driver_id, presence: true
end
