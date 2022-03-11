class AddClothingTypeReferenceToClothingPieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :clothing_pieces, :clothing_type_ids,
                    column: :clothing_type_id
    add_index :clothing_pieces, :clothing_type_id
    change_column_null :clothing_pieces, :clothing_type_id, false
  end
end
