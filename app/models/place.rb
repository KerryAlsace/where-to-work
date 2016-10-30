class Place < ApplicationRecord
  belongs_to :neighborhood
  belongs_to :user, foreign_key: 'creator_id', counter_cache: true
  has_many :shared_places
  has_many :friends, through: :shared_places, class_name: 'User'
  has_one :address, inverse_of: :place
  accepts_nested_attributes_for :address

  validates_presence_of :name, :neighborhood

  def comments
    if !shared_places
      return []
    elsif shared_places
      shared_places.collect do |shared_place|
        if shared_place.comment != nil && shared_place.comment != ""
          shared_place.comment
        end
      end
    end
  end

  def current_user_shared_place(current_user)
    if friends.include?(current_user)
      s = shared_places.where(friend_id: current_user.id)
      s.first
    end
  end

  def add_comment_to_place(comment, current_user)
    s = current_user_shared_place(current_user)
    s.comment = comment
    s.save
  end

  def creator
    User.where(id: creator_id).first
  end

end