class User < ApplicationRecord
  enum role: [ :user, :admin ]

  has_many :places
  has_many :friendships
  has_many :shared_places, through: :friendships, source: :place

  has_secure_password
end
