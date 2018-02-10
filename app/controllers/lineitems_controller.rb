class LineitemsController < ApplicationController
  before_action :set_lineitem, only: [:show, :update, :destroy]

  # GET /lineitems
  def index
    @lineitems = Lineitem.all

    render json: @lineitems
  end

  # GET /lineitems/1
  def show
    render json: @lineitem
  end

  # POST /lineitems
  def create
    @lineitem = Lineitem.new(lineitem_params)

    if @lineitem.save
      render json: @lineitem, status: :created, location: @lineitem
    else
      render json: @lineitem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lineitems/1
  def update
    if @lineitem.update(lineitem_params)
      render json: @lineitem
    else
      render json: @lineitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lineitems/1
  def destroy
    @lineitem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lineitem_params
      params.fetch(:lineitem, {})
    end
end
