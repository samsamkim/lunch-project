class DailyMenu < ApplicationRecord
  has_and_belongs_to_many :courses

  validates :date, presence: true, uniqueness: true
  # validates :price, presence: true

  private


end
