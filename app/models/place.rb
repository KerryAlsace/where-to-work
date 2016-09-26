class Place < ApplicationRecord
  belongs_to :user
  has_many :friendships
  has_many :shared_places, through: :friendships, source: :user
end
