class SharedPlace < ApplicationRecord
  belongs_to :place
  belongs_to :friend, class_name: 'User'
  # has_one :friend, foreign_key: 'friend_id'
end