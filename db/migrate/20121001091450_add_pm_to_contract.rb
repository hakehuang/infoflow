class AddPmToContract < ActiveRecord::Migration
  def change
    change_table :contracts do |t|
      t.references :user
    end
  end
end
