class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.references :customer
      t.references :contract
      t.string :inquiry_from
      t.date :start_date
      t.date :rcv_customer_sample_date
      t.timestamps
    end
  end
end
