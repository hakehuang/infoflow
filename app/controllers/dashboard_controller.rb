class DashboardController < ApplicationController
require 'will_paginate/array' 
$current_page = $enum_page[0]

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

def update_range
   @searchable=1
   case params[:cata]
      when $enum_page[0]
    	@options = Customer.attribute_names
      #when $enum_page[1]
      when $enum_page[2]
    	@options = Production.attribute_names
      #when $enum_page[3]
      when $enum_page[4]
    	@options = Contract.attribute_names
      when $enum_page[5]
    	@options = Product.attribute_names
      when $enum_page[6]
    	@options = Manufacture.attribute_names
      else
        @options = ""
   end
  
   render :partial => "range", :object => @options
end

def sort
   common_sort($current_page, params[:type])
end

def customer
    @searchable = 1
    @options = Customer.attribute_names
    @default = @options[0]
    $cdefault = "customer"
    $current_page = $enum_page[0]
    @customers = Customer.paginate(:page => params[:page], :per_page => 30)
   render 'index'
end

def project
    @searchable = 1
    @options = Project.attribute_names
    @default = @options[1]
    $cdefault = "project"
    $current_page = $enum_page[1]
    @projects = Project.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end

def production
    @searchable = 1
    @options = Production.attribute_names
    @default = @options[1]
    $cdefault = "production"
    $current_page = $enum_page[2]
    @productions = Production.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end

def contract
    @searchable = 1
    @options = Contract.attribute_names
    @default = @options[1]
    $cdefault = "contract"
    $current_page = $enum_page[4]
    @contracts = Contract.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end


def product
    @searchable = 1
    @options = Product.attribute_names
    @default = @options[1]
    $cdefault = "product"
    $current_page = $enum_page[4]
    @products = Product.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end

def manufacture
    @searchable = 1
    @options = Manufacture.attribute_names
    @default = @options[1]
    $cdefault = "manufacture"
    $current_page = $enum_page[5]
    @manufactures = Manufacture.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end



 #def update
 #   @customer = Customer.find(params[:id])
 #   @customer.update_attributes(params[:customer])
 #   respond_with @customer
 # end

end
