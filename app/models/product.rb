class Product < ActiveRecord::Base
  attr_accessible :certification, :name, :serial_no
  has_and_belongs_to_many :manufactures
  has_and_belongs_to_many :contracts
  has_paper_trail
end
