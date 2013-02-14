class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :link
      t.string :desc
      t.string :icons

      t.timestamps
    end
    add_index :sites, :link, :unique => true
  end
end
