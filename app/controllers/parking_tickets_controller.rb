class ParkingTicketsController < ApplicationController
  def index 
    @search = current_parking_lot.parking_tickets.includes(:car, :parking_spot).ransack(params[:q])
    @parked_tickets = @search.result(distinct: true)
  end
end
