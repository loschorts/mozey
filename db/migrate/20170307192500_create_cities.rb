class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
    	t.string :name
    end

    add_reference :units, :city, index: true
  end
end
