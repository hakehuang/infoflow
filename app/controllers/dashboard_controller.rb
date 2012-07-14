class DashboardController < ApplicationController

def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

end
