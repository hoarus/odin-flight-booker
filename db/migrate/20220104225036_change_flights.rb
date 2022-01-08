class ChangeFlights < ActiveRecord::Migration[6.1]
  def change
    remove_column :flights, :arrival_aiport_id, :integer
    add_column :flights, :arrival_airport_id, :integer
  end
end
