class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.integer "departure_airport_id"
      t.integer "arrival_aiport_id"
      t.datetime "start_datetime"
      t.time "duration"
      t.timestamps
    end
  end
end
