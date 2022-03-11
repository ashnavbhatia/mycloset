class Api::V1::ClothingTypeIdsController < Api::V1::GraphitiController
  def index
    clothing_type_ids = ClothingTypeIdResource.all(params)
    respond_with(clothing_type_ids)
  end

  def show
    clothing_type_id = ClothingTypeIdResource.find(params)
    respond_with(clothing_type_id)
  end

  def create
    clothing_type_id = ClothingTypeIdResource.build(params)

    if clothing_type_id.save
      render jsonapi: clothing_type_id, status: :created
    else
      render jsonapi_errors: clothing_type_id
    end
  end

  def update
    clothing_type_id = ClothingTypeIdResource.find(params)

    if clothing_type_id.update_attributes
      render jsonapi: clothing_type_id
    else
      render jsonapi_errors: clothing_type_id
    end
  end

  def destroy
    clothing_type_id = ClothingTypeIdResource.find(params)

    if clothing_type_id.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: clothing_type_id
    end
  end
end
