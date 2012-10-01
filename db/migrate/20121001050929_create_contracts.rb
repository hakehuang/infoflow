class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :No
      t.string :summary
      t.date :prefoma_sales_contract
      t.date :deposit_rcvd
      t.date :expected_ship_date
      t.references :customer

      t.timestamps
    end
    add_index :contracts, :customer_id
  end
end
