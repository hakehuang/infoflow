class Site < ActiveRecord::Base
  attr_accessible :desc, :icons, :link, :name
  belongs_to :user
  has_many :sitetagmaps
  has_many :tags, :through => :sitetagmaps
end
