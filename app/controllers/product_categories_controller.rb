class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: [:show, :update, :destroy]

  # GET /products/:product_id/product_categories
  def index
    @product_categories = ProductCategory.where(product_id: params[:product_id])

    jsonator @product_categories
  end

  # GET /products/:product_id/product_categories/1
  def show
    jsonator @product_category
  end

  # POST /products/:product_id/product_categories
  def create
    @product_category = ProductCategory.new(product_category_params)

    if @product_category.save
      jsonator @product_category
    else
      render json: @product_category.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /product_categories/1
  # def update
  #   if @product_category.update(product_category_params)
  #     render json: @product_category
  #   else
  #     render json: @product_category.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /product_categories/1
  # def destroy
  #   @product_category.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.where(product_id: params[:product_id]).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_category_params
      params.fetch(:product_category, {}).permit(:product_id, :category_id)
    end
end
