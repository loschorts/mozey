class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
    	t.references :user, null: false
    	t.references :unit, null: false
    	t.datetime :starting, null: false
    	t.datetime :ending, null: false
      t.timestamps
    end
  end
end
