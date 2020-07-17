class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :type
      t.string :name
      t.string :description
      t.integer :weight
      t.integer :portion
      t.integer :final_price
      t.integer :weight_ratio
      t.integer :portion_ratio
      t.decimal :price_ratio, precision: 5, scale: 4

      t.timestamps
    end
  end
end
