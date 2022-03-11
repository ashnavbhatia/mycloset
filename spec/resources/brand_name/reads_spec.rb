require "rails_helper"

RSpec.describe BrandNameResource, type: :resource do
  describe "serialization" do
    let!(:brand_name) { create(:brand_name) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(brand_name.id)
      expect(data.jsonapi_type).to eq("brand_names")
    end
  end

  describe "filtering" do
    let!(:brand_name1) { create(:brand_name) }
    let!(:brand_name2) { create(:brand_name) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: brand_name2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([brand_name2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:brand_name1) { create(:brand_name) }
      let!(:brand_name2) { create(:brand_name) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      brand_name1.id,
                                      brand_name2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      brand_name2.id,
                                      brand_name1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
