class Airport < ApplicationRecord
  validates :city, presence: true
  validates :code, length: { is: 3 }, presence: true
end
