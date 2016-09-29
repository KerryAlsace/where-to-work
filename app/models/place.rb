class Place < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :creator, class_name: 'User'
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'

  def user_comments
    if shared_places != nil
      shared_places.each do |shared_place|
        "#{comment_list}"
      end
    end
  end
end
