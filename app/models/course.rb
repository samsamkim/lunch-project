class Course < ApplicationRecord
  scope :weight_based, -> { where(type: 'WeightBased') }
  scope :portion_based, -> { where(type: 'PortionBased') }

  belongs_to :daily_menu, optional: true
  belongs_to :category

  validates :name, presence: true
  validates :price_ratio, presence: true

  before_destroy :check_for_menu

  private

  def check_for_menu
    raise 'You cannot destroy this Course as it is included in a daily menu' if self.daily_menu.present?
  end

end
