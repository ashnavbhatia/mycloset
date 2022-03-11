class BrandNamesController < ApplicationController
  before_action :set_brand_name, only: %i[show edit update destroy]

  def index
    @q = BrandName.ransack(params[:q])
    @brand_names = @q.result(distinct: true).includes(:clothing_pieces).page(params[:page]).per(10)
  end

  def show
    @clothing_piece = ClothingPiece.new
  end

  def new
    @brand_name = BrandName.new
  end

  def edit; end

  def create
    @brand_name = BrandName.new(brand_name_params)

    if @brand_name.save
      redirect_to @brand_name, notice: "Brand name was successfully created."
    else
      render :new
    end
  end

  def update
    if @brand_name.update(brand_name_params)
      redirect_to @brand_name, notice: "Brand name was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @brand_name.destroy
    redirect_to brand_names_url,
                notice: "Brand name was successfully destroyed."
  end

  private

  def set_brand_name
    @brand_name = BrandName.find(params[:id])
  end

  def brand_name_params
    params.fetch(:brand_name, {})
  end
end
