class ClothingTypeId < ApplicationRecord
  # Direct associations

  has_many   :clothing_pieces,
             foreign_key: "clothing_type_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
