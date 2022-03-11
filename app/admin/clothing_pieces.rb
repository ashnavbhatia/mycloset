ActiveAdmin.register ClothingPiece do
  permit_params :user_id, :photo, :size, :brand_name_id, :clothing_type_id,
                :last_used_date, :borrowed, :borrower_id, :name, :description

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
