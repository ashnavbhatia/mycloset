require "rails_helper"

RSpec.describe "brand_names#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/brand_names/#{brand_name.id}", payload
  end

  describe "basic update" do
    let!(:brand_name) { create(:brand_name) }

    let(:payload) do
      {
        data: {
          id: brand_name.id.to_s,
          type: "brand_names",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BrandNameResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { brand_name.reload.attributes }
    end
  end
end
