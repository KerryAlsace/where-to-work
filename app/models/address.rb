class Address < ApplicationRecord
	belongs_to :place, inverse_of: :address
	validates_presence_of :city
end
