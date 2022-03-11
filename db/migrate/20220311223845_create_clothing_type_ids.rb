class CreateClothingTypeIds < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_type_ids do |t|

      t.timestamps
    end
  end
end
