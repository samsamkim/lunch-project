class PortionBased < Course
  validates :portion_ratio, presence: true
  validates :portion, presence: true

  before_save :calculate_final_price

  private

  def calculate_final_price
    self.final_price = self.portion * (self.price_ratio / self.portion_ratio)
  end

end