module ApplicationHelper
def resource_name
    :admins
  end

  def resource
    @resource ||= Admin.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admins]
  end

end
