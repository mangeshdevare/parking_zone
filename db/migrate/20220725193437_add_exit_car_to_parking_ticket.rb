class AddExitCarToParkingTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :parking_tickets, :exit_car, :boolean
  end
end
