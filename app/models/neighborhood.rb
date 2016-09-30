class Neighborhood < ApplicationRecord
  has_many :places
  validates_presence_of :name
  validates_uniqueness_of :name
end
