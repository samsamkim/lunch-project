class AddCategoryToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :category, null: false, foreign_key: true
  end
end
