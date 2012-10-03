class Product < ActiveRecord::Base
  attr_accessible :certification, :name
  has_and_belongs_to_many :manufactures
  has_and_belongs_to_many :contracts
end
