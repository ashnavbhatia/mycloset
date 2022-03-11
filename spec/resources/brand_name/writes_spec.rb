require "rails_helper"

RSpec.describe BrandNameResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "brand_names",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BrandNameResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { BrandName.count }.by(1)
    end
  end

  describe "updating" do
    let!(:brand_name) { create(:brand_name) }

    let(:payload) do
      {
        data: {
          id: brand_name.id.to_s,
          type: "brand_names",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BrandNameResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { brand_name.reload.updated_at }
      # .and change { brand_name.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:brand_name) { create(:brand_name) }

    let(:instance) do
      BrandNameResource.find(id: brand_name.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { BrandName.count }.by(-1)
    end
  end
end
