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
  
 params.values.each do |param|
        if param == "check"
            @nrelate = RolesUsers.new
            @nrelate.user_id = params[:user][:id]
            @nrelate.role_id = @role.id
            @nrelate.save
        end
  end

  @relates = RolesUsers.where("user_id" + "LIKE :range", :range => "%" + @user_id + "%")
  @relates.each do |relate|
    @role = Role.find(relate.role_id)
     params.each do |param|
        if @role.role == param.key and @param.value == "uncheck"
            relate.destroy
        end
    end
  end
  
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
  end
end
 
end
