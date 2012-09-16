class SearchEngineController < ApplicationController

def do_search
    @searchable = 1 
    @search_condition = params[:title][:name]
    @search_range = params[:range]
    @search_cata = params[:cata]
    case @search_cata
    when "customer"
   	@options = Customer.attribute_names
    	@default = @options[0]
    	@customers = Customer.where(@search_range + " LIKE :range", :range => "%" +  @search_condition + "%").paginate(:page => params[:page], :per_page => 30)
    	render '/customers/index'
    else
    end
end

end
