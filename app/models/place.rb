class Place < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :creator, class_name: 'User'
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'

  def comments
    if !shared_places
      return []
    elsif shared_places
      shared_places.collect do |shared_place|
        shared_place.comment
      end
    end
  end

end
