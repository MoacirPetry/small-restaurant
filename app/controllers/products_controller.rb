class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:new, :edit, :update]

  def index
    # @products = Product.all.order(:name).page(params[:page])
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page])
  end

  def new
    @product = Product.new()
  end

  def edit
  end

  def create
    @product = Product.create(params_product)

    unless @product.errors.any?
      redirect_to products_path, notice: "Product #{@product.name} registered!!"
    else
      render :new
    end
  end

  def update
    if @product.update(params_product)
      redirect_to products_path, notice: "Product updated!!"
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: "#{@product.name} deleted!!"
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @categories = Category.all
  end

  def params_product
    params.require(:product).permit(:name, :price, :description, :category_id)
  end
end
