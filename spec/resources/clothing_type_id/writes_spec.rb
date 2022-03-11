require "rails_helper"

RSpec.describe ClothingTypeIdResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "clothing_type_ids",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ClothingTypeIdResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ClothingTypeId.count }.by(1)
    end
  end

  describe "updating" do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    let(:payload) do
      {
        data: {
          id: clothing_type_id.id.to_s,
          type: "clothing_type_ids",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ClothingTypeIdResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { clothing_type_id.reload.updated_at }
      # .and change { clothing_type_id.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    let(:instance) do
      ClothingTypeIdResource.find(id: clothing_type_id.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ClothingTypeId.count }.by(-1)
    end
  end
end
