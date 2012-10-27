class AdminRolesController < ApplicationController

def index
  @users = User.paginate(:page => params[:page], :per_page => 30)
  @roles = Role.all
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
  end
end

def update
  @user_id = params[:user_id]
  @relate = RolesUsers.where("user_id" + "LIKE :range", :range => "%" + @user_id + "%")
end 

end
