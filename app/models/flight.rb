class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :duration, presence: true
  validates :start_datetime, presence: true

  def departure_date_formatted
    self.start_datetime.strftime("%m/%d/%Y")
  end
end
