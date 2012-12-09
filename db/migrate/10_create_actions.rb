class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.string :alias
      t.string :meta_k
      t.string :meta_d
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
