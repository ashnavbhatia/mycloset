class ClothingTypeIdsController < ApplicationController
  before_action :set_clothing_type_id, only: %i[show edit update destroy]

  # GET /clothing_type_ids
  def index
    @q = ClothingTypeId.ransack(params[:q])
    @clothing_type_ids = @q.result(distinct: true).includes(:clothing_pieces).page(params[:page]).per(10)
  end

  # GET /clothing_type_ids/1
  def show
    @clothing_piece = ClothingPiece.new
  end

  # GET /clothing_type_ids/new
  def new
    @clothing_type_id = ClothingTypeId.new
  end

  # GET /clothing_type_ids/1/edit
  def edit; end

  # POST /clothing_type_ids
  def create
    @clothing_type_id = ClothingTypeId.new(clothing_type_id_params)

    if @clothing_type_id.save
      redirect_to @clothing_type_id,
                  notice: "Clothing type was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /clothing_type_ids/1
  def update
    if @clothing_type_id.update(clothing_type_id_params)
      redirect_to @clothing_type_id,
                  notice: "Clothing type was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /clothing_type_ids/1
  def destroy
    @clothing_type_id.destroy
    redirect_to clothing_type_ids_url,
                notice: "Clothing type was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_clothing_type_id
    @clothing_type_id = ClothingTypeId.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def clothing_type_id_params
    params.fetch(:clothing_type_id, {})
  end
end
