class ClothingTypeIdResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :clothing_pieces,
             foreign_key: :clothing_type_id

  # Indirect associations
end
