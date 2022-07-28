class ParkingLot < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :parking_spots
  has_many :parking_tickets

  validates :name, :capacity, :hourly_charge, :status, :address, :email, presence: true
  validates :hourly_charge,  numericality: { greater_than: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
  validates :email, format: { with: Devise.email_regexp}

  after_commit :create_parking_spots, on: :create

  def create_parking_spots
    capacity.to_i.times{|index| ParkingSpot.create!(number: index+1, vacant: true, parking_lot_id: id)}
  end
end
