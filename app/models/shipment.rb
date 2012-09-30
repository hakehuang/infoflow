class Shipment < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  belongs_to :product
  belongs_to :production
  belongs_to :contract
  attr_accessible :actual_ship, :expected_ship, :lead, :return_tax, :write-off
end
