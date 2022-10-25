class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :flights

  validates :departure_airport_id, presence: true
  validates :arrival_airport_id, presence: true
  validates :duration, presence: true
  validates :start_datetime, presence: true

  def departure_date_formatted
    self.start_datetime.strftime("%b %d, %Y")
  end

  def duration_formatted
    hours = self.duration.strftime("%I").to_i
    minutes = self.duration.strftime("%M").to_f
    hour_fraction = (minutes/60* 10).to_i
    return "#{hours}.#{hour_fraction} hours"
  end
end
