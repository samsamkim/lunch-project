class Course < ApplicationRecord
  scope :weight_based, -> { where(type: 'WeightBased') }
  scope :portion_based, -> { where(type: 'PortionBased') }

  has_and_belongs_to_many :daily_menus
  belongs_to :category

  validates :name, presence: true
  validates :price_ratio, presence: true

  before_destroy :check_for_menu

  private

  def check_for_menu
    raise 'You cannot destroy this Course as it is included in a daily menu' if self.daily_menus.present?
  end

end
