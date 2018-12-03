class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :user, foreign_key: true
      t.integer :registration_number
      t.integer :estimated_kilometers
      t.text :why_selling
      t.string :picture
      t.integer :exact_kilometer
      t.string :location
      t.string :car_brand
      t.date :year_of_production
      t.text :car_registration_document
      t.date :first_registration_date
      t.string :fuel_type
      t.string :gearbox
      t.string :model_type
      t.string :model_version
      t.string :model_variant
      t.text :announce_description
      t.integer :maximum_net_power
      t.string :commercial_name
      t.integer :CNIT_code
      t.integer :VIN_code
      t.string :cylinder
      t.integer :fiscal_horsepower
      t.integer :seating_place_number
      t.integer :door_number
      t.integer :CO2_emission
      t.string :environmental_class
      t.date :next_technical_control_date
      t.integer :given_price
      t.integer :estimated_price
      t.text :maintenance_record

      t.timestamps
    end
  end
end
