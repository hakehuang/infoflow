class CreateManufacturesProducts < ActiveRecord::Migration
  def change
    create_table :manufactures_products do |t|
     t.references :manufacture
     t.references :product
     t.timestamps
    end
  end
end
