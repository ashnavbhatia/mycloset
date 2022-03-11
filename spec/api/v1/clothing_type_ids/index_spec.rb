require 'rails_helper'

RSpec.describe "clothing_type_ids#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/clothing_type_ids", params: params
  end

  describe 'basic fetch' do
    let!(:clothing_type_id1) { create(:clothing_type_id) }
    let!(:clothing_type_id2) { create(:clothing_type_id) }

    it 'works' do
      expect(ClothingTypeIdResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['clothing_type_ids'])
      expect(d.map(&:id)).to match_array([clothing_type_id1.id, clothing_type_id2.id])
    end
  end
end
