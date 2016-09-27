class Place < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :creator, class_name: 'User'
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'
end
