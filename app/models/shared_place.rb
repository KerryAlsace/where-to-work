class SharedPlace < ApplicationRecord
  belongs_to :place
  has_many :friends, class_name: 'User'
end