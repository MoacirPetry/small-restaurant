class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_customer, :set_user, :set_table, :set_product

  def index
    # @orders = Order.all.order(:id).page(params[:page])
    @q = Order.ransack(params[:q])
    @orders = @q.result.includes(:customer, :table).page(params[:page])
  end

  def new
    @order = Order.new()
  end

  def edit
  end

  def create
    @order = Order.create(params_order)

    unless @order.errors.any?
      Table.find(@order.table.id).update_attribute(:status, true)
      redirect_to orders_path, notice: "Order #{@order.id} registered!!"
    else
      render :new
    end
  end

  def update
    if @order.update(params_order)  && @order.status == true
      Table.find(@order.table.id).update_attribute(:status, false)
      redirect_to orders_path, notice: "Order updated!!"
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      redirect_to orders_path, notice: "#{@order.id} deleted!!"
    else
      render :index
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customer
    @customers = Customer.all
  end

  def set_user
    @users = User.all
  end

  def set_table
    # @tables = Table.all
    @tab = Table.where(:status => false)
  end

  def set_product
    @products = Product.all
  end

  def params_order
    params.require(:order).permit(:status, :total, :customer_id, :user_id, :table_id, order_products_attributes: [:id, :order_id, :product_id, :_destroy, products_attributes: [:id, :name, :_destroy]])
  end
end
