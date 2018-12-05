class RemoveColumnFirstRegistrationDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :first_registration_date
  end
end
