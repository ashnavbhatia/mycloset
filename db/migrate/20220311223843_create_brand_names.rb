class CreateBrandNames < ActiveRecord::Migration[6.0]
  def change
    create_table :brand_names do |t|
      t.timestamps
    end
  end
end
