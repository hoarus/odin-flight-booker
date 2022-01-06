class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
  validates :passenger_id, presence: true

  before_validation :find_or_create_passenger
  before_save :ensure_confirmation

  def to_param
    confirmation
  end

  private

  def find_or_create_passenger
    self.passengers = self.passengers.map do |passenger|
      Passenger.find_or_create_by(email: passenger.email, name: passenger.name)
    end
  end

  def ensure_confirmation
    return if confirmation

    loop do
      self.confirmation = generate_confirmation_number
      break unless self.class.where(confirmation: confirmation).exists?
    end
  end

  def generate_confirmation_number(size = 6)
    charset = %w{ A C D E F G H J K M N P Q R T V W X Y Z }
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
  
end
