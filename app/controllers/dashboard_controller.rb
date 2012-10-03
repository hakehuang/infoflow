class DashboardController < ApplicationController
$current_page = $enum_page[0]

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

def update_range
   @searchable=1
   logger.info "DEBUGING update_range"
   case params[:cata]
      when $enum_page[0]
    	@options = Customer.attribute_names
      #when $enum_page[1]
        
      #when $enum_page[2]
      when $enum_page[3]
    	@options = Contract.attribute_names
      when $enum_page[4]
    	@options = Product.attribute_names
      #when $enum_page[5]
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
    @page_id = 0
    $cdefault = "customer"
    $current_page = $enum_page[0]
    @customers = Customer.paginate(:page => params[:page], :per_page => 30)
   render 'index'
end

def contract
    @searchable = 1
    @options = Contract.attribute_names
    @default = @options[1]
    @page_id = 3
    $cdefault = "contract"
    $current_page = $enum_page[3]
    @contracts = Contract.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end

def product
    @searchable = 1
    @options = Product.attribute_names
    @default = @options[1]
    @page_id = 4
    $cdefault = "product"
    $current_page = $enum_page[4]
    @products = Product.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end


 #def update
 #   @customer = Customer.find(params[:id])
 #   @customer.update_attributes(params[:customer])
 #   respond_with @customer
 # end

end
