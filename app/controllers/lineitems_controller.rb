class LineitemsController < ApplicationController
  before_action :set_lineitem, only: [:show, :update, :destroy]

  # GET /customers/:customer_id/orders/:order_id/lineitems
  def index
    # TODO: Also take params[:product_id] into account
    @lineitems = Lineitem.where(order_id: params[:order_id])

    jsonator @lineitems
  end

  # GET /customers/:customer_id/orders/:order_id/lineitems/1
  def show
    jsonator @lineitem
  end

  # POST /customers/:customer_id/orders/:order_id/lineitems
  def create
    @lineitem = Lineitem.new(lineitem_params)

    if @lineitem.save
      jsonator @lineitem
    else
      render json: @lineitem.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /lineitems/1
  # def update
  #   if @lineitem.update(lineitem_params)
  #     render json: @lineitem
  #   else
  #     render json: @lineitem.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /lineitems/1
  # def destroy
  #   @lineitem.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.where(order_id: params[:order_id]).find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def set_order
      @order = Order.find(params[:order_id])
    end

    # Only allow a trusted parameter "white list" through.
    def lineitem_params
      params.fetch(:lineitem, {}).permit(:order_id, :sku_id, :quantity)
    end
end
