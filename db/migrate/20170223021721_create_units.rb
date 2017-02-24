class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
    	t.string :serial, null: false, unique: true
      t.timestamps
    end
  end
end
