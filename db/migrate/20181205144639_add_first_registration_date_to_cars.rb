class AddFirstRegistrationDateToCars < ActiveRecord::Migration[5.2]
  def change
     add_column :cars, :first_registration_date, :integer
  end
end
