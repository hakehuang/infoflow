class CreateRolesViews < ActiveRecord::Migration
  def change
    create_table :roles_views do |t|
      t.references :role
      t.string :viewname
      t.timestamps
    end
  end
end
