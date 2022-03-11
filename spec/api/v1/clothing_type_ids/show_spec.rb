require 'rails_helper'

RSpec.describe "clothing_type_ids#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/clothing_type_ids/#{clothing_type_id.id}", params: params
  end

  describe 'basic fetch' do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    it 'works' do
      expect(ClothingTypeIdResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('clothing_type_ids')
      expect(d.id).to eq(clothing_type_id.id)
    end
  end
end
