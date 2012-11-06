class BpmController < ApplicationController

def index
@models=ActiveRecord::Base.descendants.select{|x| x.name}

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
end

end
