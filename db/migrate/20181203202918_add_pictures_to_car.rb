class AddPicturesToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :photo_1, :string
    add_column :cars, :photo_2, :string
    add_column :cars, :photo_3, :string
    remove_column :cars, :picture, :string
  end
end
