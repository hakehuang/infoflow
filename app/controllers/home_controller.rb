class HomeController < ApplicationController
#before_filter :authenticate_user!

def index
    @catas = Cata.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

end
