class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :destination_id
      t.integer :origin_id
      t.date :departure_date
      t.time :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
