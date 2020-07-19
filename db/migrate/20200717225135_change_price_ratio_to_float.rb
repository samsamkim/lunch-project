class ChangePriceRatioToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :price_ratio, :float
  end
end
