class DailyMenusController < ApplicationController

  before_action :set_daily_menu, only: [:show, :edit, :update, :destroy]

  def index
    @daily_menus = DailyMenu.includes(:courses, {courses: :category}).all
  end

  def new
    @daily_menu = DailyMenu.new
    @categories = Category.includes(:courses).all
  end

  def create
    @categories = Category.includes(:courses).all
    @daily_menu = DailyMenu.new(daily_menu_params)
    if @daily_menu.save
      redirect_to daily_menus_path
    else
      render 'new'
    end

  end

  def edit; end

  def update
    if @daily_menu.update(daily_menu_params)
      redirect_to daily_menus_path
    else
      render 'edit'
    end
  end

  def destroy
    @daily_menu.destroy
    redirect_to daily_menus_path
  end


  private

  def set_daily_menu
    @daily_menu = DailyMenu.find(params[:id])
  end

  def daily_menu_params
    params.require(:daily_menu).permit(:date, :price, course_ids: [])
  end
  
end
