class CourseAndDailyMenuManyToManyAssociation < ActiveRecord::Migration[6.0]
  def change
    remove_reference :courses, :daily_menu, index: true, foreign_key: true

    create_join_table :courses, :daily_menus do |t|
      t.index [:course_id, :daily_menu_id]
      t.index [:daily_menu_id, :course_id]
    end
  end
end
