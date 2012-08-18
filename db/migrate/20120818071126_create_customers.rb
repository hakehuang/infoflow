class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :Market
      t.string :name
      t.string :Address
      t.decimal :Postal_Code
      t.string :city
      t.string :Country
      t.decimal :Tel
      t.decimal :Fax
      t.string :Contactor_a
      t.string :Contactor_b
      t.string :cell_a
      t.string :cell_b
      t.string :web_page
      t.string :Email
      t.string :MSN
      t.string :Skype
      t.text :Invoicing_Requirement
      t.text :shipping_Document_requirements

      t.timestamps
    end
  end
end
