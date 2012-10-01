class AddCreatorToCustomer < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.references :user
    end
  end
end
