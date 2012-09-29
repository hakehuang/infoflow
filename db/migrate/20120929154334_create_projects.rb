class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.references :customer
      t.string :Inquery_from
      t.references :product
      t.date :SD
      t.date :Rcv_customer_sample
      t.references :manufacturer
      t.references :contract

      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :customer_id
    add_index :projects, :product_id
    add_index :projects, :manufacturer_id
    add_index :projects, :contract_id
  end
end
