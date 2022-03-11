json.extract! clothing_piece, :id, :user_id, :photo, :size, :brand_name_id,
              :clothing_type_id, :last_used_date, :borrowed, :borrower_id, :name, :description, :created_at, :updated_at
json.url clothing_piece_url(clothing_piece, format: :json)
