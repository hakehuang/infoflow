class Cata < ActiveRecord::Base
  attr_accessible :name
  has_many :catamaps
  has_many :parents, :through => :catamaps
  has_many :inverse_catamaps, :class_name => "Catamap", :foreign_key => "parent_id"
  has_many :inverse_parents, :through => :inverse_catamaps, :source => :cata
  def tname
    I18n.t("#{name.to_s}.#{name.to_s}")
  end
end
