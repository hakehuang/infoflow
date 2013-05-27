class TagsController < ApplicationController

def index 
    @tags = Tag.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
   end
end

def new
  @tag = Tag.new
  @tag.user_id = current_user.id
  @tag.publish = false
  if @tag.save
    flash[:notice] = "new tag created"
    redirect_to tags_path
  else
    flash[:error] = "new tag creatation failed"
    render :action => 'new'
  end
end

def update
   @tag = Tag.find_by_id(params[:id])
  respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to tags_path, notice: 'tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
end

def create
  @tag = Tag.new(params[:tag])
  @tag.publish = false
  @tag.user_id = current_user.id
  if @tag.save
    flash[:notice] = "new tag created"
    redirect_to sites_path
  else
    flash[:error] = "new tag creatation failed"
    render :action => 'new'
  end
end

def destroy
  @tag = Tag.find_by_id(params[:id])
  @tag.destroy
  redirect_to tags_path
end

end 
