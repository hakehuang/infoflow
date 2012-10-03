class Contract < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  attr_accessible :No, :deposit_rcvd, :expected_ship_date, :prefoma_sales_contract, :summary
  has_many :projects
  has_and_belongs_to_many :products
has_paper_trail
end
