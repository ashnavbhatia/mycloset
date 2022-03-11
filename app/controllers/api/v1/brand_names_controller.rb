class Api::V1::BrandNamesController < Api::V1::GraphitiController
  def index
    brand_names = BrandNameResource.all(params)
    respond_with(brand_names)
  end

  def show
    brand_name = BrandNameResource.find(params)
    respond_with(brand_name)
  end

  def create
    brand_name = BrandNameResource.build(params)

    if brand_name.save
      render jsonapi: brand_name, status: 201
    else
      render jsonapi_errors: brand_name
    end
  end

  def update
    brand_name = BrandNameResource.find(params)

    if brand_name.update_attributes
      render jsonapi: brand_name
    else
      render jsonapi_errors: brand_name
    end
  end

  def destroy
    brand_name = BrandNameResource.find(params)

    if brand_name.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: brand_name
    end
  end
end
