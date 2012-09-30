class Production < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :product
  belongs_to :contract
  belongs_to :shipment
  attr_accessible :QC_final, :QC_in_production, :customer_approval_counter_sample, :factory_counter_sample, :pre_production_sample, :production_start
end
