class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user
      t.string :number
      t.string :details
      t.date :prefoma_sale_date
      t.date :deposit_rcvd_date
      t.date :payment_tt_data

      t.timestamps
    end
    add_index :contracts, :user_id
  end
end
