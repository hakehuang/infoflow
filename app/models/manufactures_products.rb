class ManufacturesProducts < ActiveRecord::Base
  belongs_to :manufacture
  belongs_to :product
  has_paper_trail
end
