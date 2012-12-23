class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :address
      t.boolean :up
      t.boolean :delivery
      t.boolean :phone
      t.string :fio
      t.string :email

      t.timestamps
    end
  end
end
