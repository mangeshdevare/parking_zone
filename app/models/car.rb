class Car < ApplicationRecord
  has_many :parking_tickets

  validates :registration_number, :color, presence: true
end
