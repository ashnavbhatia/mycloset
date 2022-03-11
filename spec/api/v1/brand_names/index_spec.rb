require "rails_helper"

RSpec.describe "brand_names#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/brand_names", params: params
  end

  describe "basic fetch" do
    let!(:brand_name1) { create(:brand_name) }
    let!(:brand_name2) { create(:brand_name) }

    it "works" do
      expect(BrandNameResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["brand_names"])
      expect(d.map(&:id)).to match_array([brand_name1.id, brand_name2.id])
    end
  end
end
