class Sitetagmap < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :site
  belongs_to :tag
end
