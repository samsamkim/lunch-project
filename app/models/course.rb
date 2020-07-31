class Course < ApplicationRecord
  scope :measurement_based, -> { where(type: 'MeasurementBased') }
  scope :portion_based, -> { where(type: 'PortionBased') }

  has_and_belongs_to_many :daily_menus
  has_one :measurement, dependent: :destroy
  has_many :pricings, dependent: :destroy
  belongs_to :category

  accepts_nested_attributes_for :measurement, reject_if: :all_blank

  validates :name, presence: true
  validates_associated :measurement
  validates_presence_of :measurement
  # validates :price_ratio, presence: true

  before_destroy :check_for_menu

  private

  def check_for_menu
    raise 'You cannot destroy this Course as it is included in a daily menu' if self.daily_menus.present?
  end

end
