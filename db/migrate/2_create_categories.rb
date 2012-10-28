class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :meta_d
      t.string :meta_k
      t.boolean :active
      t.boolean :trash
      t.text :description

      t.timestamps
    end
  end
end
