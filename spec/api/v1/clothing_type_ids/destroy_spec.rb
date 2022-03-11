require 'rails_helper'

RSpec.describe "clothing_type_ids#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/clothing_type_ids/#{clothing_type_id.id}"
  end

  describe 'basic destroy' do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    it 'updates the resource' do
      expect(ClothingTypeIdResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ClothingTypeId.count }.by(-1)
      expect { clothing_type_id.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
