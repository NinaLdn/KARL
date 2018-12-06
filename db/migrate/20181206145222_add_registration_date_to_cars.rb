class AddRegistrationDateToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :registration_date, :date
  end
end
