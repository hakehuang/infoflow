class AddCreatorSites < ActiveRecord::Migration
  def up
    add_column :sites, :user_id, :integer 
  end

  def down
    remove_column :sites, :user_id
  end
end
