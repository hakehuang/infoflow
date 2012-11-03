class SearchEngineController < ApplicationController

def sort

end

def do_search
    @searchable = 1 
    @search_condition = params[:title][:name]
    @search_range = params[:range]
    @search_cata = params[:cata]
    case @search_cata
    when "customer"
   	@options = Customer.attribute_names
    	@default = @options[0]
    	@customers = Customer.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 5)
    	render '/customers/index'
    when "contract"
   	@options = Contract.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[3]
    	@contracts = Contract.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 5)
    	render '/contracts/index'
    when "product"
   	@options = Product.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[4]
    	@products = Product.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 5)
    	render '/products/index'
    when "manufacture"
        @options = Manufacture.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[4]
    	@products = Manufacture.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 5)
    	render '/manufactures/index'
    else
   	@options = Contract.attribute_names
    	@default = @options[1]
        $cdefault = $coptions[3]
    	@contracts = Contract.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 5)
    	render '/contracts/index'
    end
end

end
