class CreateDamages < ActiveRecord::Migration[5.2]
  def change
    create_table :damages do |t|
      t.references :car, foreign_key: true
      t.string :title
      t.text :description
      t.string :picture_1
      t.string :picture_2
      t.string :picture_3

      t.timestamps
    end
  end
end
