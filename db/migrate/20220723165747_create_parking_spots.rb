class CreateParkingSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_spots do |t|
      t.bigint :number
      t.boolean :vacant
      t.references :parking_lot, foreign_key: true

      t.timestamps
    end
  end
end
