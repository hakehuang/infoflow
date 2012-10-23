class ContractsController < ApplicationController

 def index
    @searchable = 1
    @options = Contract.attribute_names
    @default = @options[1]
    $cdefault = $coptions[3]
    if ! params[:customer].nil?
   @contracts = Contract.where("customer_id" + " LIKE :range", :range => "%" +  params[:customer] + "%").paginate(:page => params[:page], :per_page => 30)
    elsif ! params[:id].nil?
   @contracts = Contract.where("id" + " LIKE :range", :range => "%" +  params[:id] + "%").paginate(:page => params[:page], :per_page => 30)
    else
    @contracts = Contract.paginate(:page => params[:page], :per_page => 30)
    end
    respond_to do |format|
	format.html # index.html.erb
	format.xml  
    end
 end
 
 def add_product

  if ! params[:add_product].nil?
     @product = Product.find(:all, :conditions => {:name => params[:add_product]})
     @products = Product.find(@product, :joins => :contracts, :conditions => {:contracts => {:id => params[:contract][:id]}})
     if @products.count > 0
      redirect_to dashboard_contract_path, :notice => "product alread add"
      return
     end
     @join = ContractsProducts.new
     @join.product_id = @product[0].id
     @join.contract_id = params[:contract][:id]

      if @join.save
        redirect_to dashboard_contract_path, :notice => "add product ok"
      else
        redirect_to dashboard_contract_path, :notice => "add product fail"
      end
    return
  end
    rescue ActiveRecord::RecordNotFound
        redirect_to dashboard_contract_path, :notice => "add product no found" 
 end

 def new
    @contract = Contract.new
    if ! params[:customer].nil?
      @contract.customer_id = params[:customer]
    end
    @contract.user_id = current_user.id
    respond_to do |format|
      if @contract.save
        format.html { redirect_to dashboard_contract_path(@contract) , :notice => "create contract" }
        format.xml  { render :xml => @contract, :status => :created, :location => @contract }
      else
        @isnew = 1
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @customer }
#    end
 end

 def edit
    @contract = Contract.find(params[:id])
 end

 def update
    @contract = Contract.find(params[:id])
    if @contract.user and @contract.user.id != current_user.id and @contract.user.isadmin == false
      return
    end
    #@custmer.update_attributes(params[:customer])
    respond_to do |format|
    if @contract.update_attributes(params[:contract])
      format.html { redirect_to(@contract, :notice => 'successfully updated.') }
      format.json { respond_with_bip(@contract) }
    else
      format.html { redirect_to(@contract, :alert => 'update attributes failed.')}
      format.json { respond_with_bip(@contract) }
    end
    
  end
  end

  def sort

  end

end
