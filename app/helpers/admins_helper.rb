module AdminsHelper
  def no_categories
    Category.all.empty?
  end

end
