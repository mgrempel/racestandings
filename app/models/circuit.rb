class Circuit < ApplicationRecord
  has_many :laptimes
  has_and_belongs_to_many :seasons
end
