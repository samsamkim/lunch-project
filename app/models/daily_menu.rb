class DailyMenu < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :pricings, dependent: :destroy

  validates :date, presence: true, uniqueness: true
  accepts_nested_attributes_for :pricings, reject_if: :all_blank

  private


end
