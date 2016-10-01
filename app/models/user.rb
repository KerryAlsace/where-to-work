class User < ApplicationRecord
  has_many :places, foreign_key: 'creator_id'
  has_many :shared_places, foreign_key: 'friend_id'
  enum role: [ :user, :admin ]

  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_secure_password(validations: false)

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

  def real_shared_places
    shared_places.collect do |shared_place|
      place = shared_place.place
      if shared_place.friend_id != place.creator_id
        shared_place
      end
    end
  end

  def places_from_shared_places
    real_shared_places.collect do |shared_place|
      if shared_place != nil
        shared_place.place
      end
    end
  end

end