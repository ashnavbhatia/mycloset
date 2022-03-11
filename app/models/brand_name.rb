class BrandName < ApplicationRecord
  # Direct associations

  has_many   :clothing_pieces,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
