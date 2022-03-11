class ClothingPiece < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :photo, :presence => true

  validates :size, :inclusion => { :in => [ "XS", "S", "M", "L", "XL", "XXL", "3XL", "" ]  }

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
