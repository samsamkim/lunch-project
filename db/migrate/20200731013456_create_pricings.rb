class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.decimal :final_price, precision: 12, scale: 2

      t.timestamps
    end
  end
end
