class Driver < ApplicationRecord
  has_many :laptimes
  validates :first_name, :last_name, required: true
end
