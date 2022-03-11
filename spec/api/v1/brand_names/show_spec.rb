require "rails_helper"

RSpec.describe "brand_names#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/brand_names/#{brand_name.id}", params: params
  end

  describe "basic fetch" do
    let!(:brand_name) { create(:brand_name) }

    it "works" do
      expect(BrandNameResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("brand_names")
      expect(d.id).to eq(brand_name.id)
    end
  end
end
