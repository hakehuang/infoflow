class CataController < ApplicationController
  
def index
    @catas = Cata.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
   end
end
  
  def show
    @catas = Cata.all
    @cata = Cata.find(params[:id])
  end
  
  def new
    @cata = Cata.new
    @catas = Cata.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cata }
    end
  end
  
  def create
    @cata = Cata.new(params[:cata])
    if @cata.save
      flash[:notice] = "new cata created"
      redirect_to root_path     
    else
      render :action => 'new'
    end
  end
 
  def list
    @pcata = params[:pp]
    @catamaps = Catamap.where("parent_id = :id", :id => @pcata)
  end
end
