class BrandNamesController < ApplicationController
  before_action :set_brand_name, only: %i[show edit update destroy]

  # GET /brand_names
  def index
    @q = BrandName.ransack(params[:q])
    @brand_names = @q.result(distinct: true).includes(:clothing_pieces).page(params[:page]).per(10)
  end

  # GET /brand_names/1
  def show
    @clothing_piece = ClothingPiece.new
  end

  # GET /brand_names/new
  def new
    @brand_name = BrandName.new
  end

  # GET /brand_names/1/edit
  def edit; end

  # POST /brand_names
  def create
    @brand_name = BrandName.new(brand_name_params)

    if @brand_name.save
      redirect_to @brand_name, notice: "Brand name was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /brand_names/1
  def update
    if @brand_name.update(brand_name_params)
      redirect_to @brand_name, notice: "Brand name was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /brand_names/1
  def destroy
    @brand_name.destroy
    redirect_to brand_names_url,
                notice: "Brand name was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brand_name
    @brand_name = BrandName.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def brand_name_params
    params.fetch(:brand_name, {})
  end
end
