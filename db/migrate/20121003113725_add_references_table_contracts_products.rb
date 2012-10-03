class AddReferencesTableContractsProducts < ActiveRecord::Migration
  def up
    create_table :contracts_products do |t|
     t.references :contract
     t.references :product
    end
  end

  def down
    drop_table :contracts_products
  end
end
