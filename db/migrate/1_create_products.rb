class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :meta_d
      t.string :meta_k
      t.decimal :price
      t.string :garranty
      t.string :duration
      t.string :delivery
      t.boolean :active
      t.boolean :trash
      t.string :notice
      t.text :description

      t.timestamps
    end
  end
end
