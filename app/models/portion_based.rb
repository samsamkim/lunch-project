class PortionBased < Course
  validates :portion_ratio, presence: true
  validates :portion, presence: true

end