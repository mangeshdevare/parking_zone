class ParkingSpot < ApplicationRecord
  belongs_to :parking_lot

  validates :number, presence: true


  scope :open_spots, -> { where(vacant: true) }
end
