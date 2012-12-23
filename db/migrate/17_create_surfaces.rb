class CreateSurfaces < ActiveRecord::Migration
  def change
    create_table :surfaces do |t|
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
