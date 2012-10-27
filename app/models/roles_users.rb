class RolesUsers < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to user
  belongs_to role
  has_paper_trail
end
