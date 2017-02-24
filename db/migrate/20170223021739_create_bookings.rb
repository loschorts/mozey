class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
    	t.references :user
    	t.references :unit
    	t.datetime :starting
    	t.datetime :ending
      t.timestamps
    end
  end
end
