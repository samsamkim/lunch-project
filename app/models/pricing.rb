class Pricing < ApplicationRecord
  belongs_to :course
  belongs_to :daily_menu

  validates :final_price, presence: true

  private

end
