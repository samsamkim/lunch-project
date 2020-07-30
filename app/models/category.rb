class Category < ApplicationRecord
  has_many :courses

  validates :name, presence: true
  before_destroy :check_courses

  private

  def check_courses
    raise 'You cannot destroy this Category as there are courses existing in it' if self.courses.present?
  end

end
