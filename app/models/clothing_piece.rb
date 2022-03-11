class ClothingPiece < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :borrower

  belongs_to :clothing_type,
             class_name: "ClothingTypeId"

  belongs_to :brand_name

  belongs_to :user

  # Indirect associations

  # Validations

  validates :clothing_type_id,
            inclusion: { in: ["top", "bottom", "dress", "romper/jumpsuit", "sweater",
                              "jacket", "accessories"] }

  validates :name, uniqueness: true

  validates :name, presence: true

  validates :photo, presence: true

  validates :size,
            inclusion: { in: ["XS", "S", "M", "L", "XL", "XXL", "3XL", ""] }

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
