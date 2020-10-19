class Circuit < ApplicationRecord
  has_many :laptimes
  has_and_belongs_to_many :seasons
  validates :name, :locality, :country, presence: true
end
