class CatamapController < ApplicationController
 def create 
  @cata = Cata(param[:cata_id])
  @catamap = @cata.catamaps.build(:catamap_id => params[:parent_id])
  if @catamap.save
   flash[:notice] = "link catamap"
  else
   flash[:notice] = "failed link catamap"
  end
 end

 def destroy
  @cata = Cata(param[:cata_id])
  @catamap = @cata.catamaps.find(params[:id])
  @catamap.destroy
  flash[:notice] = "remove catamap" 
 end
end
