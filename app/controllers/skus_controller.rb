class SkusController < ApplicationController
  before_action :set_sku, only: [:show, :update, :destroy]

  # GET /skus
  def index
    @skus = Sku.all

    jsonator @skus
  end

  # GET /skus/1
  def show
    jsonator @sku
  end

  # POST /skus
  def create
    # TODO: make use of params[:product_id] instead of keeping paams[:sku][:product_id] required
    @sku = Sku.new(sku_params)

    if @sku.save
      jsonator @sku
    else
      render json: @sku.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skus/1
  def update
    if @sku.update(sku_params)
      render json: @sku
    else
      render json: @sku.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skus/1
  def destroy
    @sku.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sku
      @sku = Sku.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sku_params
      params.fetch(:sku, {}).permit(:product_id, :unit_id, :unit_price_in_cents, :decimal_factor)
    end
end
