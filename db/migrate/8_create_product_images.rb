class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :urlname
      t.integer :product_id
      t.timestamps
    end
  end
end
