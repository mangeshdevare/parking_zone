class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.text :registration_number
      t.text :color
      t.text :brand
      t.text :model
      t.text :type

      t.timestamps
    end
  end
end
