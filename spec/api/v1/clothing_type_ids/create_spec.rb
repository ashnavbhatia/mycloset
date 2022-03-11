require "rails_helper"

RSpec.describe "clothing_type_ids#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/clothing_type_ids", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "clothing_type_ids",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ClothingTypeIdResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { ClothingTypeId.count }.by(1)
    end
  end
end
