class CreateFoodtrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :foodtrucks do |t|
      t.string :name
      t.integer :num_workers
      t.boolean :checked_in
      t.string :food_type

      t.timestamps
    end
  end
end
