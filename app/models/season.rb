class Season < ApplicationRecord
  has_many :laptimes
  has_and_belongs_to_many :circuits
  validates :year, :url, presence: true
end
