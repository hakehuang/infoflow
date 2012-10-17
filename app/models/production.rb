class Production < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :factory_counter_sample_date, :customer_approval_of_counter_sample_date, :start_date, :pre_production_sample_approval_date, :qc_during_production_date, :final_qc_date
  belongs_to :users
  belongs_to :projects
end
