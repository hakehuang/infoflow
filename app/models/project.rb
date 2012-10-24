class Project < ActiveRecord::Base
  attr_accessible :inquiry_from, :start_date, :rcv_customer_sample_date
  belongs_to :user
  belongs_to :contract
  has_many :productions
  has_many :shipments
end
