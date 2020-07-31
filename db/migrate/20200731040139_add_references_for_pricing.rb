class AddReferencesForPricing < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :pricing, foreign_key: true
    add_reference :pricings, :daily_menu, foreign_key: true
  end
end
