class User < ApplicationRecord
	has_many :bookings
	has_many :units, through: :bookings
end
