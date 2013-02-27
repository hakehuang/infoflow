class Catamap < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :cata
  belongs_to :parent, :class_name => "Cata"
end
