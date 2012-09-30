class Manufacture < ActiveRecord::Base
  belongs_to :user
  attr_accessible :certification, :contactor, :location
end
