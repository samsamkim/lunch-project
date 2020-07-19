class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.includes(:category).all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end

  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    if params.has_key? :weight_based
      params[:course] = params.delete :weight_based
    elsif params.has_key? :portion_based
      params[:course] = params.delete :portion_based
    end
    params.require(:course).permit(:type, :name, :description, :weight, :portion, :final_price, :weight_ratio, :portion_ratio, :price_ratio, :category_id, :daily_menu_id)
  end

end
