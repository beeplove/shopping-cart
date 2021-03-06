class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    jsonator @products
  end

  # GET /products/:id
  def show
    jsonator @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      jsonator @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /products/1
  # def update
  #   if @product.update(product_params)
  #     render json: @product
  #   else
  #     render json: @product.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /products/1
  # def destroy
  #   @product.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.fetch(:product, {}).permit(:name)
    end
end
