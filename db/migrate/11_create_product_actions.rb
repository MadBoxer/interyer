class CreateProductsActions < ActiveRecord::Migration
  def change
    create_table :product_actions do |t|
      t.integer :product_id
      t.integer :action_id

      t.timestamps
    end
  end
end
