class AddSerialNumToProduct < ActiveRecord::Migration
  def change
    add_column :products, :serial_no, :string 
    add_index  :products, :serial_no, :unique => true 
  end
end
