class ApplicationController < ActionController::Base
  protect_from_forgery
  $coptions = ["customer", "project", "production", "shipment","contract", "product", "manufacture"]
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
    @searchable = 1
    case page
	when $enum_page[0]
    	@options = Customer.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[0]
    	@customers = Customer.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
        when $enum_page[1]
        @options = Project.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[0]
    	@projects = Project.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
        when $enum_page[2]
        @options = Production.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[0]
    	@productions = Production.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
    	when $enum_page[4]
    	@options = Contract.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[3]
    	@customers = Contract.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
        when $enum_page[5]
    	@options = Product.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[4]
    	@products = Product.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
        when $enum_page[6]
    	@options = Manufacture.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[4]
    	@products = Manufacture.find(:all, :order => type +  " ASC" ).paginate(:page => params[:page], :per_page => 30)
        else
	@searchable = 0
    end
  end
end
