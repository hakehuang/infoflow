class CreateManufactures < ActiveRecord::Migration
  def change
    create_table :manufactures do |t|
      t.references :user
      t.string :location
      t.string :certification
      t.string :contactor

      t.timestamps
    end
    add_index :manufactures, :user_id
  end
end
