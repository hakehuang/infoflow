class Manufacture < ActiveRecord::Base
  attr_accessible :name, :location, :tel, :fax, :address, :contractor_a, :contractor_b, :cell_a, :cell_b, :web_page, :email, :msn, :skype  
  has_and_belongs_to_many :products
  has_paper_trail
end
