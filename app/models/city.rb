class City < ApplicationRecord
	has_one :location, as: :object
end
