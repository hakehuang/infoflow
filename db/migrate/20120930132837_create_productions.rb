class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.references :user
      t.references :customer
      t.references :product
      t.date :factory_counter_sample
      t.date :customer_approval_counter_sample
      t.references :contract
      t.date :production_start
      t.date :pre_production_sample
      t.date :QC_in_production
      t.date :QC_final
      t.references :shipment

      t.timestamps
    end
    add_index :productions, :user_id
    add_index :productions, :customer_id
    add_index :productions, :product_id
    add_index :productions, :contract_id
    add_index :productions, :shipment_id
  end
end
