class WeightBased < Course
  validates :weight_ratio, presence: true
  validates :weight, presence: true



end