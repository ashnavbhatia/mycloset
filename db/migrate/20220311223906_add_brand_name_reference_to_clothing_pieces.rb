class AddBrandNameReferenceToClothingPieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :clothing_pieces, :brand_names
    add_index :clothing_pieces, :brand_name_id
    change_column_null :clothing_pieces, :brand_name_id, false
  end
end
