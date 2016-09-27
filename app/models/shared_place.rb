class SharedPlace < ApplicationRecord
  belongs_to :place
  belongs_to :friend, class_name: 'User'
end