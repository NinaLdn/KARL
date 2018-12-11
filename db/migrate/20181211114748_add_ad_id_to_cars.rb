class AddAdIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :add_id, :integer
  end
end
