class Product < ActiveRecord::Base
  belongs_to :manufacturer
  attr_accessible :certification_1, :name
end
