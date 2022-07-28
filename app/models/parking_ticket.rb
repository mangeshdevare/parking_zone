class ParkingTicket < ApplicationRecord
  belongs_to :car
  belongs_to :parking_spot
  belongs_to :parking_lot

 
  validates :payment_mode, inclusion: { in: ["Cash", "UPI", "Card", "Unpaid", "Other"],
    message: "%{value} is not a valid payment mode" }
  validate :already_parked_car, on: :create

  before_create :assign_ticket_number
  
  scope :current_parked_cars, -> { where('out_time IS NULL') }

  def already_parked_car
    ticket  = ParkingTicket.where('car_id =? AND exit_car != ?', car_id, true).last
    errors.add(:car_id, "is shown already parked") if ticket.present?
  end

  def assign_ticket_number
    loop do
      ticket_number = SecureRandom.hex(8)
      break if ParkingTicket.find_by(ticket_number: ticket_number).nil?
    end
  end 

  def update_parking_spot_status(status)
    parking_spot.update(vacant: status)
  end

end
