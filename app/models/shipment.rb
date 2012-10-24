class Shipment < ActiveRecord::Base
  attr_accessible :lead_time, :actual_ship_date, :writeoff
  belongs_to :project
  has_paper_trail
end
