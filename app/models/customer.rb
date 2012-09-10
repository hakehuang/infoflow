class Customer < ActiveRecord::Base
  attr_accessible :Address, :Contactor_a, :Contactor_b, :Country, :Email, :Fax, :Invoicing_Requirement, :MSN, :Market, :Postal_Code, :Skype, :Tel, :cell_a, :cell_b, :city, :name, :shipping_Document_requirements, :web_page
has_paper_trail
end
