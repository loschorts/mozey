class Unit < ApplicationRecord
	has_many :bookings
	has_many :users, through: :bookings
	belongs_to :city
	has_one :location, as: :object
end
