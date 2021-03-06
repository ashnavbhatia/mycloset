class ClothingPieceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :photo, :string
  attribute :size, :string
  attribute :brand_name_id, :integer
  attribute :clothing_type_id, :integer
  attribute :last_used_date, :date
  attribute :borrowed, :boolean
  attribute :borrower_id, :integer
  attribute :name, :string
  attribute :description, :string

  # Direct associations

  belongs_to :borrower

  belongs_to :clothing_type,
             resource: ClothingTypeIdResource

  belongs_to :brand_name

  belongs_to :user

  # Indirect associations
end
