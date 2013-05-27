class CreateAddsitetagmaps < ActiveRecord::Migration
  def change
    create_table :sitetagmaps do |t|
      t.integer :site_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
