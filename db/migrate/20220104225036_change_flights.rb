class ChangeFlights < ActiveRecord::Migration[6.1]
  def change
    remove_column :flights, :arrival_aiport_id, :big_int
    add_column :flights, :arrival_airport_id, :big_int
  end
end
