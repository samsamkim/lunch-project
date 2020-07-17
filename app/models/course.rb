class Course < ApplicationRecord
  scope :weight_based, -> { where(type: 'WeightBased') }
  scope :portion_based, -> { where(type: 'PortionBased') }

  belongs_to :daily_menu, optional: true
  belongs_to :category

  validates :name, presence: true
  validates :price_ratio, presence: true

  before_create :calculate_final_price

  def calculate_final_price
    self.final_price = 5 if self.type === 'WeightBased'
    self.final_price 10 if self.type === 'PortionBased'
  end


end
