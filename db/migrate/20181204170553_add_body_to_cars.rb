class AddBodyToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :body, :string
  end
end
