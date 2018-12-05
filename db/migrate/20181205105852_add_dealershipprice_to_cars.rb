class AddDealershippriceToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :dealership_price, :integer
  end
end
