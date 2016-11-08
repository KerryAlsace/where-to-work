class Place < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :user, foreign_key: 'creator_id', counter_cache: true
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'
  has_one :address, inverse_of: :place
  has_many :comments
  accepts_nested_attributes_for :address

  validates_presence_of :name, :neighborhood

  def current_user_shared_place(current_user)
    if friends.include?(current_user)
      s = shared_places.where(friend_id: current_user.id)
      s.first
    end
  end

  def creator
    User.where(id: creator_id).first
  end

end