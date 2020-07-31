class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.references :course, null: false, foreign_key: true
      t.string :unit
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
