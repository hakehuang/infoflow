class AddUniqToContract < ActiveRecord::Migration
  def change
   add_index  :contracts, :No, :unique => true
  end
end
