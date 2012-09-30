class Contract < ActiveRecord::Base
  belongs_to :user
  attr_accessible :deposit_rcvd_date, :details, :number, :payment_tt_data, :prefoma_sale_date
end
