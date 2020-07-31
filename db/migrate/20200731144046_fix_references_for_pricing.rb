class FixReferencesForPricing < ActiveRecord::Migration[6.0]
  def change
    remove_reference :courses, :pricing, foreign_key: true
    add_reference :pricings, :course, foreign_key: true
  end
end
