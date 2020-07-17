class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
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

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  # def set_type
  #   case params[:course][:type]
  #   when 'WeightBased'
  #     'weight_based'
  #   when 'PortionBased'
  #     'portion_based'
  #   end
  #   debugger
  # end

  def course_params
    params.require(:course).permit(:type, :name, :description, :weight, :portion, :final_price, :weight_ratio, :portion_ratio, :price_ratio, :category_id, :daily_menu_id)
  end


end
