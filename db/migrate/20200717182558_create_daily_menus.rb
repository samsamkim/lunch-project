class CreateDailyMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_menus do |t|
      t.date :date
      t.decimal :price

      t.timestamps
    end
  end
end
