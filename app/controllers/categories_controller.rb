class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.includes(:courses).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      redirect_to new_category_path, flash: { alert: @category.errors.full_messages.join(', ') }
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      redirect_to edit_category_path, flash: { alert: @category.errors.full_messages.join(', ') }
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  rescue_from 'Category::StandardError' do |exception|
    redirect_to categories_path, alert: exception.message
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end


end
