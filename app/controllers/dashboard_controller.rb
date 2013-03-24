class DashboardController < ApplicationController

def index
    @sites = Site.all
    @catas = Cata.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

end
