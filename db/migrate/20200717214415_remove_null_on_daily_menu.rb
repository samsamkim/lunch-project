class RemoveNullOnDailyMenu < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :daily_menu_id, :bigint, null: true
  end
end
