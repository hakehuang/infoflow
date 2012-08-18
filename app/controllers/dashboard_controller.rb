class DashboardController < ApplicationController

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

def customer
    @page_id = 0
    @customers = Customer.all
    render 'index'
end

end
