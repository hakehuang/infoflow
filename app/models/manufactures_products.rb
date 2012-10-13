class ManufacturesProducts < ActiveRecord::Base
  belongs_to :manufactures
  belongs_to :products
  has_paper_trail
end
