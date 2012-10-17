class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.date  :factory_counter_sample_date
      t.date :customer_approval_of_counter_sample_date
      t.date :start_date
      t.date :pre_production_sample_approval_date
      t.date :qc_during_production_date
      t.date :final_qc_date
      t.references :user     
      t.references :project
      t.timestamps
    end
  end
end
