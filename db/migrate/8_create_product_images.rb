class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :url
      t.string :alt
      t.string :type
      t.integer :product_id
      t.timestamps
    end
  end
end
