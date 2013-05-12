class Site < ActiveRecord::Base
  attr_accessible :desc, :icons, :link, :name
  belongs_to :user
end
