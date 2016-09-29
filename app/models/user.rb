class User < ApplicationRecord
  enum role: [ :user, :admin ]

  has_many :places, foreign_key: 'creator_id'
  has_many :shared_places, foreign_key: 'friend_id'
  has_many :friends, through: :shared_places
  has_many :places, through: :shared_places, foreign_key: 'friend_id'

  has_secure_password

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = "placeholder"
      user.save!
    end
  end

  def oauth_user?
    self.uid != nil
  end

  def shared_place_place_associations
    places = shared_places.collect do |shared_place|
      Place.where(id: shared_place.place_id)
    end
    places.first
  end

  def all_shared_places
    shared_place_place_associations.collect do |place|
      place
    end
  end

end
