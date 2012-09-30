class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.references :user
      t.references :customer
      t.references :product
      t.date :lead
      t.references :production
      t.date :expected_ship
      t.date :actual_ship
      t.date :return_tax
      t.string :write_off
      t.references :contract

      t.timestamps
    end
    add_index :shipments, :user_id
    add_index :shipments, :customer_id
    add_index :shipments, :product_id
    add_index :shipments, :production_id
    add_index :shipments, :contract_id
  end
end
