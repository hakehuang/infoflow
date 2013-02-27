class CataController < ApplicationController
 def index
    @catas = Cata.all
  end
  
  def show
    @cata = Cata.find(params[:id])
  end
  
  def new
    @cata = Cata.new
  end
  
  def create
    @cata = Cata.new(params[:cata])
    if @cata.save
      flash[:notice] = "new cata created"
    else
      render :action => 'new'
    end
  end
 
  def list
    @pcata = params[:pp]
    @catamaps = Catamap.where("parent_id = :id", :id => @pcata)
  end
end
