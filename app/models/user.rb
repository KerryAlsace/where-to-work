class User < ApplicationRecord
  enum role: [ :user, :admin ]

  has_many :places

  has_secure_password
end
