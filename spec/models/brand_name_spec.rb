require "rails_helper"

RSpec.describe BrandName, type: :model do
  describe "Direct Associations" do
    it { should have_many(:clothing_pieces) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
