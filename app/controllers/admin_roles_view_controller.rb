class AdminRolesViewController < ApplicationController

def index
  @roles_view = RolesViews
  @views = $enum_page
  @roles = Role.all  
  render 'index'
end

def update
  @role_id = params[:role][:id]
  @relates = RolesViews.where("role_id" + " " + "LIKE :range", :range => "%" + @role_id + "%")
  @keep = [].to_set
  $enum_page.each do |view|
    if params.keys.include?(view)
      @find = 0
      params.keys.each do |param|
        if params[param] == "check"
            @relates.each do |relate|
              if relate.viewname == view and relate.role_id == @role_id
                @keep.add(relate.id)
                @find = 1
              end
            end
            if @find == 0
                @nrelate = RolesViews.new
                @nrelate.viewname = view
                @nrelate.role_id = @role_id
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
  @role = Role.find(@role_id) 
  redirect_to admin_roles_view_index_path, :notice => "update " + @role.role
end

end
