require "rails_helper"

RSpec.describe "brand_names#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/brand_names/#{brand_name.id}"
  end

  describe "basic destroy" do
    let!(:brand_name) { create(:brand_name) }

    it "updates the resource" do
      expect(BrandNameResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BrandName.count }.by(-1)
      expect { brand_name.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
