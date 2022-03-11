class CreateClothingPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_pieces do |t|
      t.integer :user_id
      t.string :photo
      t.string :size
      t.integer :brand_name_id
      t.integer :clothing_type_id
      t.date :last_used_date
      t.boolean :borrowed
      t.integer :borrower_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
