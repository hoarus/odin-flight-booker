class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.integer "booking_id"
      t.string "name"
      t.email "email"
      t.timestamps
    end
  end
end
