class ContractsController < ApplicationController

 def index
    @searchable = 1
    @options = Contract.attribute_names
    @default = @options[1]
    @contracts = Contract.paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
	format.html # index.html.erb
	format.xml  
    end
 end

 def new
    @contract = Contract.new
    @contract.user.id = current_user.id
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
