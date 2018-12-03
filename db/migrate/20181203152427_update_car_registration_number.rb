class UpdateCarRegistrationNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :registration_number, :string
  end
end
