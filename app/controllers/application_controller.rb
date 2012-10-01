class ApplicationController < ActionController::Base
  protect_from_forgery
  $coptions = ["customer", "project", "production", "contract"]
  $cdefaults = "customer"
  $enum_page = $coptions 
  def after_sign_in_path_for(resource)
	dashboard_index_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def common_sort(page,type) 
  require 'will_paginate/array'
    case page
	when $enum_page[0]
	@searchable = 1
    	@options = Customer.attribute_names
    	@default = @options[1]
    	@customers = Customer.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
    	else
    end
  end
end
