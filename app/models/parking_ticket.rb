class ParkingTicket < ApplicationRecord
  belongs_to :car
  belongs_to :parking_spot
  belongs_to :parking_lot
end
