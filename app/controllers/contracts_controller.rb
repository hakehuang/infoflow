class ContractController < ApplicationController
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


end
