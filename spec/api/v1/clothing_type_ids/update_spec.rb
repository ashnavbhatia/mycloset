require "rails_helper"

RSpec.describe "clothing_type_ids#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/clothing_type_ids/#{clothing_type_id.id}", payload
  end

  describe "basic update" do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    let(:payload) do
      {
        data: {
          id: clothing_type_id.id.to_s,
          type: "clothing_type_ids",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ClothingTypeIdResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { clothing_type_id.reload.attributes }
    end
  end
end
