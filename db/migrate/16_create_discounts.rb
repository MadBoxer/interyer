class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :value
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
