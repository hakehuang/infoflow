class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :product
  belongs_to :manufacturer
  belongs_to :contract
  attr_accessible :Inquery_from, :Rcv_customer_sample, :SD
end
