class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :dish_name
      t.integer :price
      t.boolean :in_stock
      t.references :foodtruck, foreign_key: true

      t.timestamps
    end
  end
end
