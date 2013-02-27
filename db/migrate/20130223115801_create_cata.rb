class CreateCata < ActiveRecord::Migration
  def change
    create_table :cata do |t|
      t.string :name
      t.timestamps
    end
  end
end
