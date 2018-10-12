class TablesController < ApplicationController
  before_action :set_table, only: [:edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new()
  end

  def edit
  end

  def create
    @table = Table.create(params_table)

    unless @table.errors.any?
      redirect_to tables_path, notice: "Table #{@table.id} registered!!"
    else
      render :new
    end
  end

  def update
    if @table.update(params_table)
      redirect_to tables_path, notice: "Table updated!!"
    else
      render :edit
    end
  end

  def destroy
    if @table.destroy
      redirect_to tables_path, notice: "#{@table.id} deleted!!"
    else
      render :index
    end
  end

  private

  def set_table
    @table = Table.find(params[:id])
  end

  def params_table
    params.require(:table).permit(:status, :limit)
  end
end
