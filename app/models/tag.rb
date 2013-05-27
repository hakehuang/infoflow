class Tag < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :publish
  belongs_to :user
  has_many :sitetagmap
  has_many :sites, :through => :sitetagmap
end
