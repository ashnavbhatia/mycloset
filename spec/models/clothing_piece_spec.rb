require 'rails_helper'

RSpec.describe ClothingPiece, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:clothing_type_id).in_array([ "top", "bottom", "dress", "romper/jumpsuit", "sweater", "jacket", "accessories" ]) }

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:photo) }

    it { should validate_inclusion_of(:size).in_array([ "XS", "S", "M", "L", "XL", "XXL", "3XL", "" ]) }

    it { should validate_presence_of(:user_id) }

    end
end
