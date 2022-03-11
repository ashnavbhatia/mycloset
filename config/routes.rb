Rails.application.routes.draw do
  resources :clothing_type_ids
  resources :brand_names
  resources :clothing_pieces
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
