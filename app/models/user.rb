class User < ApplicationRecord
  enum role: [ :user, :admin ]

  has_many :places, foreign_key: 'creator_id'
  has_many :shared_places, foreign_key: 'friend_id'
  has_many :friends, through: :shared_places
  has_many :places, through: :shared_places, foreign_key: 'friend_id'

  has_secure_password
end
