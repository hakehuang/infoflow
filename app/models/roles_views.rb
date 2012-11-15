class RolesViews < ActiveRecord::Base
  attr_accessible :viewname
  belongs_to :role
end
