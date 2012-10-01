class DashboardController < ApplicationController
$current_page = $enum_page[0]

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
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
    @default = @options[3]
    @page_id = 3
    $cdefault = "contract"
    $current_page = $enum_page[3]
    @contracts = Contract.paginate(:page => params[:page], :per_page => 30)
    render 'index'
end

 #def update
 #   @customer = Customer.find(params[:id])
 #   @customer.update_attributes(params[:customer])
 #   respond_with @customer
 # end

end
