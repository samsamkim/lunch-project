class Category < ApplicationRecord
  has_many :courses

  before_destroy :check_courses

  private

  def check_courses
    return true if self.courses.empty?
    errors.add :courses, "Cannot delete booking with payments"
    throw(:abort)
  end

end
