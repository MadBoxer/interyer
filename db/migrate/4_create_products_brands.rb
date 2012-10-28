class CreateProductsBrands < ActiveRecord::Migration
  def change
    create_table :products_brands do |t|
      t.integer :product_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
