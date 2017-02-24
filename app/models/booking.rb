class Booking < ApplicationRecord
	validates :user_id, :unit_id, :starting, :ending, presence: true
	validate :availability
	validate :dates
	belongs_to :user
	belongs_to :unit

	def self.seed
		starting = rand(Date.civil(2017, 1, 1)..Date.civil(2017, 12, 31))
		ending = starting + 5
		Booking.new(
			user: User.all.sample, 
			unit: Unit.all.sample, 
			starting: starting,
			ending: ending
		)
	end

	def short
		{
			id: id,
			email: user.email,
			serial: unit.serial,
			starting: starting,
			ending: ending
		}
	end

	def overlapping_requests
		Booking
			.where.not(id: id)
			.where(unit: unit)
			.where("starting between ? and ? or ending between ? and ?", starting, ending, starting, ending)
	end

	private 

	def availability	
		errors.add(:dates, "One or more overlapping bookings already scheduled") unless overlapping_requests.empty?
	end

	def dates
		if starting && ending
			errors.add(:dates, "Starting date must be before Ending date") unless starting < ending
		end
	end
end
