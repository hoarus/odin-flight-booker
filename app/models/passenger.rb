class Passenger < ApplicationRecord
  belongs_to :booking, inverse_of: :passengers

  validates :booking_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
end
