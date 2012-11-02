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
  @relates = RolesUsers.where("user_id" + " " + "LIKE :range", :range => "%" + @user_id + "%")
  @keep = [].to_set
  @roles.each do |role|
    if params.keys.include?(role.role)
      @find = 0
      params.keys.each do |param|
        if params[param] == "check"
            @relates.each do |relate|
              if relate.user_id.to_s  == @user_id and relate.role_id == role.id
                @keep.add(relate.id)
                @find = 1
              end
            end
            if @find == 0
                @nrelate = RolesUsers.new
                @nrelate.user_id = @user_id
                @nrelate.role_id = role.id
                @nrelate.save
            end
        end
      end
    end
  end
  @relates.each do |relate|
    if ! @keep.include? relate.id
      relate.destroy
    end
  end
  @user = User.find(@user_id) 
  redirect_to admin_roles_path, :notice => "update roles for " + @user.username
end
 
end
