class CustomersController < ApplicationController

def index
    	@customers = Customer.all
	respond_to do |format|
		format.html # index.html.erb
		format.xml  
	end
end

def new
    @customer = Customer.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pcustomer }
    end
end

def edit
    @customer = Customer.find(params[:id])
 end

 def update
    @customer = Customer.find(params[:id])
    #@custmer.update_attributes(params[:customer])
    respond_to do |format|
    if @customer.update_attributes(params[:customer])
      format.html { redirect_to(@customer, :notice => 'successfully updated.') }
      format.json { respond_with_bip(@customer) }
    else
      format.html { render :action => "edit" }
      format.json { respond_with_bip(@customer) }
    end
    
  end
  end

  # POST /products
  # POST /products.xml
  def create
    @customer = Customer.new(params[:customer])
    
    respond_to do |format|
      if @customer.save
        format.html { redirect_to dashboard_customer_path(@customer) , :notice => "create customer" }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        @isnew = 1
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end



end
