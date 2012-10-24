class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.date :lead_time
      t.date :actual_ship_date
      t.date :tax_return_date
      t.string :writeoff
      t.references :project
      t.timestamps
    end
  end
end
