class CreateAdvantages < ActiveRecord::Migration
  def change
    create_table :advantages do |t|
      t.string :name
      t.string :announce
      t.string :avatar
      t.boolean :active

      t.timestamps
    end
  end
end
