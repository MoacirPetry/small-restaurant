class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    # @categories = Category.all.order(:name).page(params[:page])
    @q = Category.ransack(params[:q])
    @categories = @q.result.page(params[:page])
  end

  def new
    @category = Category.new()
  end

  def edit
  end

  def create
    @category = Category.create(params_category)

    unless @category.errors.any?
      redirect_to categories_path, notice: "Category #{@category.name} registered!!"
    else
      render :new
    end
  end

  def update
    if @category.update(params_category)
      redirect_to categories_path, notice: "Category updated!!"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: "#{@category.name} deleted!!"
    else
      render :index
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:name, :description)
  end
end
