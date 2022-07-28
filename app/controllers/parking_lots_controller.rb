class ParkingLotsController < ApplicationController
    def index
        @parking_lot = current_parking_lot 
        @search = current_parking_lot.parking_tickets.current_parked_cars.includes(:car, :parking_spot).ransack(params[:q])
        @parked_cars = @search.result(distinct: true)
    end

    def admit_car
        registration_number = params[:registration_number].upcase
        color = params[:color].upcase
        car = Car.find_or_initialize_by(registration_number: registration_number)
        car.color =  color
        car.save
        parking_spot_id = current_parking_lot.parking_spots.open_spots.first.id
        parking_ticket = car.parking_tickets.create!( parking_spot_id: parking_spot_id, parking_lot_id: current_parking_lot.id, in_time: Time.now, payment_status: 'pending')
        parking_ticket.update_parking_spot_status(false)
        redirect_to parking_lots_path
    end

    def exit_car
        puts params.inspect
        @parking_ticket = ParkingTicket.joins(:car).where('cars.registration_number = ? AND parking_tickets.out_time IS NULL', params[:registration_number]).last
        unless @parking_ticket.nil?
            unless params[:payment_mode] == 'Unpaid'
                @parking_ticket.payment_mode = params[:payment_mode]
                @parking_ticket.payment_status = 'paid'
            else
                @parking_ticket.payment_status = 'unpaid'
            end
            @parking_ticket.total_charges = params[:total_charges]
            @parking_ticket.exit_car = true
            @parking_ticket.out_time = Time.now
            @parking_ticket.save
            @parking_ticket.update_parking_spot_status(true)

        else
            puts "<><><><><><><><><><>"
        end
        redirect_to parking_lots_path
    end

end
