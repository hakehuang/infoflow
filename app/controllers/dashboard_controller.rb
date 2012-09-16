class DashboardController < ApplicationController

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

def customer
    @searchable = 1
    @options = Customer.attribute_names
    @default = @options[0]
    @page_id = 0
    @customers = Customer.paginate(:page => params[:page], :per_page => 30)
   render 'index'
end

 #def update
 #   @customer = Customer.find(params[:id])
 #   @customer.update_attributes(params[:customer])
 #   respond_with @customer
 # end

end
