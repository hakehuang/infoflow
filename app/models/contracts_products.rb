class ContractsProducts < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :products
  belongs_to :contracts
end
