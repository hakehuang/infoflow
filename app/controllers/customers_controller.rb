class CustomersController < ApplicationController

 def show
    if params[:id].nil?
      redirect_to customers_path
    end 

    @searchable = 1
    @options = Customer.attribute_names
    @default = @options[1]
    @customer = Customer.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
 end


 def index
    @searchable = 1
    @options = Customer.attribute_names
    @default = @options[1]
    if ! params[:id].nil?
    @customers = Customer.where("id" +  " LIKE :range", :range => "%" +  params[:id] + "%").paginate(:page => params[:page], :per_page => 5)
    else
    @customers = Customer.paginate(:order => "Market ASC",:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
 end

 def new
    @customer = Customer.new
    @customer.user_id = current_user.id    
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
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @customer }
#    end
 end

 def edit
    @customer = Customer.find(params[:id])
 end

 def update
    @customer = Customer.find(params[:id])
    @customer.user.id = current_user.id
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
    @customer.user_id = current_user.id    
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

 def sort

 end

end
