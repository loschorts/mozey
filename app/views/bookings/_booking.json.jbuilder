json.extract! booking, :id, :id, :user_id, :unit_id, :starting, :ending, :created_at, :updated_at
json.url booking_url(booking, format: :json)
