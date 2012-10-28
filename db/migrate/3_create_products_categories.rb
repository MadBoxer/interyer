class CreateProductsCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|
      t.integer :product_id
      t.integer :categoryid

      t.timestamps
    end
  end
end
