class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    # @customers = Customer.all.order(:name).page(params[:page])
    @q = Customer.ransack(params[:q])
    @customers = @q.result.page(params[:page])
  end

  def new
    @customer = Customer.new()
  end

  def edit
  end

  def create
    @customer = Customer.create(params_customer)

    unless @customer.errors.any?
      redirect_to customers_path, notice: "Customer #{@customer.name} registered!!"
    else
      render :new
    end
  end

  def update
    if @customer.update(params_customer)
      redirect_to customers_path, notice: "Customer updated!!"
    else
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      redirect_to customers_path, notice: "#{@customer.name} deleted!!"
    else
      render :index
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def params_customer
    params.require(:customer).permit(:name, :email, :phone_number)
  end

end
