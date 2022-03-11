require 'rails_helper'

RSpec.describe ClothingTypeIdResource, type: :resource do
  describe 'serialization' do
    let!(:clothing_type_id) { create(:clothing_type_id) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(clothing_type_id.id)
      expect(data.jsonapi_type).to eq('clothing_type_ids')
    end
  end

  describe 'filtering' do
    let!(:clothing_type_id1) { create(:clothing_type_id) }
    let!(:clothing_type_id2) { create(:clothing_type_id) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: clothing_type_id2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([clothing_type_id2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:clothing_type_id1) { create(:clothing_type_id) }
      let!(:clothing_type_id2) { create(:clothing_type_id) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            clothing_type_id1.id,
            clothing_type_id2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            clothing_type_id2.id,
            clothing_type_id1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
