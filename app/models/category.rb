class Category < ApplicationRecord
  has_many :courses

  before_destroy :check_courses

  private

  def check_courses
    raise 'You cannot destroy this Category as there are courses existing in it' if self.courses.present?
    # return true if self.courses.empty?
    # errors.add :courses, "Cannot delete booking with payments"
    # throw(:abort)
  end

end
