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
  @user_id = params[:user][:id]
  @roles = Role.all
  #@urelates = RolesUsers.where("user_id" + " " + "LIKE :range", :range => "%" + @user_id + "%")
  @roles.each do |role|
    @keep = [].to_set
    @relates = RolesUsers.where("role_id" + " " + "LIKE :range", :range => "%" + role.id.to_s + "%")
    params.keys.each do |param|
        if params[param] == "check"
            @relates.each do |relate|
              if relate.user_id.to_s  == @user_id and relate.role_id == role.id
                @keep.add(relate.id)
              end
            end
            if @keep.count == 0
                @nrelate = RolesUsers.new
                @nrelate.user_id = @user_id
                @nrelate.role_id = role.id
                @nrelate.save
            end
        end
    end
    @relates.each do |relate|
        relate.destroy
    end
  end
  @user = User.find(@user_id) 
  redirect_to admin_roles_path, :notice => "update roles for " + @user.username
end
 
end
