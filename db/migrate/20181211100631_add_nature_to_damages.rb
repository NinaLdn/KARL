class AddNatureToDamages < ActiveRecord::Migration[5.2]
  def change
    add_column :damages, :nature, :string
  end
end
