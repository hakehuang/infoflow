class CreateCatamap < ActiveRecord::Migration
  def change
    create_table :catamap do |t|
      t.integer :cata_id
      t.integer :parent_id
      t.timestamps
    end
  end
end
