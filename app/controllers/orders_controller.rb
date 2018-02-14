class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /customers/:customer_id/orders
  def index
    @orders = Order.where(customer_id: params[:customer_id])

    # TODO:
    #   - in the reponse also include lineitems and possibly more data

    jsonator @orders
  end

  # GET /customers/:customer_id/orders/:id
  def show
    jsonator @order
  end

  # POST /customers/:customer_id/orders
  def create
    @order = Order.new(order_params)

    if @order.save
      jsonator @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /orders/1
  # def update
  #   if @order.update(order_params)
  #     render json: @order
  #   else
  #     render json: @order.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /orders/1
  # def destroy
  #   @order.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.where(customer_id: params[:customer_id]).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {}).permit(:customer_id, :status_id)
    end
end
