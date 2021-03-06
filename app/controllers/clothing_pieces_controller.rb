class ClothingPiecesController < ApplicationController
  before_action :current_user_must_be_clothing_piece_user,
                only: %i[edit update destroy]

  before_action :set_clothing_piece, only: %i[show edit update destroy]

  def index
    @q = ClothingPiece.ransack(params[:q])
    @clothing_pieces = @q.result(distinct: true).includes(:user,
                                                          :brand_name, :clothing_type, :borrower).page(params[:page]).per(10)
  end

  def show; end

  def new
    @clothing_piece = ClothingPiece.new
  end

  def edit; end

  def create
    @clothing_piece = ClothingPiece.new(clothing_piece_params)

    if @clothing_piece.save
      message = "ClothingPiece was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @clothing_piece, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @clothing_piece.update(clothing_piece_params)
      redirect_to @clothing_piece,
                  notice: "Clothing piece was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @clothing_piece.destroy
    message = "ClothingPiece was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to clothing_pieces_url, notice: message
    end
  end

  private

  def current_user_must_be_clothing_piece_user
    set_clothing_piece
    unless current_user == @clothing_piece.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_clothing_piece
    @clothing_piece = ClothingPiece.find(params[:id])
  end

  def clothing_piece_params
    params.require(:clothing_piece).permit(:user_id, :photo, :size,
                                           :brand_name_id, :clothing_type_id, :last_used_date, :borrowed, :borrower_id, :name, :description)
  end
end
