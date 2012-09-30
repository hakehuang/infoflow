class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :certification_1
      t.references :manufacturer

      t.timestamps
    end
    add_index :products, :manufacturer_id
  end
end
