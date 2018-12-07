class AddInfoToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :marge_nego, :integer
    add_column :cars, :rotation, :integer
    add_column :cars, :deval_250, :float
    add_column :cars, :deval_500, :float
    add_column :cars, :deval_750, :float
    add_column :cars, :deval_1000, :float
    add_column :cars, :deval_1250, :float
    add_column :cars, :deval_1500, :float
    add_column :cars, :deval_1750, :float
    add_column :cars, :deval_2000, :float
    add_column :cars, :deval_fix, :float
  end
end
