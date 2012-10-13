class CreateManufactures < ActiveRecord::Migration
  def change
    create_table :manufactures do |t|
      t.string :name, :unique => true
      t.string :location
      t.decimal :tel
      t.decimal :fax
      t.string :address 
      t.string :contactor_a
      t.string :contactor_b
      t.string :cell_a
      t.string :cell_b
      t.string :web_page
      t.string :email
      t.string :msn
      t.string :skype
      t.timestamps
    end
  end
end
