class AddCreatorToTags < ActiveRecord::Migration
  def change
    add_column :tags, :user_id, :integer 
    add_column :tags, :publish, :boolean
  end
end
