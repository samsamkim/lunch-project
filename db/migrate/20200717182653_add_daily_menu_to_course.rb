class AddDailyMenuToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :daily_menu, null: false, foreign_key: true
  end
end
