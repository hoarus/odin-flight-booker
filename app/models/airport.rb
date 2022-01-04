class Airport < ApplicationRecord
  validates :city, presence: true
  validates :code, length: { is: 3 }, presence: true

  has_many :departing_flights, foreign_key: "departure_airport_id", class_name: "Flight"
  has_many :arriving_flights, foreign_key: "arrival_airport_id", class_name: "Flight"
end
