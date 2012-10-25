class HomeController < ApplicationController
#before_filter :authenticate_user!

def index

    if user_signed_in? 
    case $cdefaults
      when "customer"
        redirect_to dashboard_customer_path, :notice => "see customers" 
        return
      when "project"
        redirect_to dashboard_project_path, :notice => "see proejcts" 
        return
      when "production"
        redirect_to dash_board_production_path, :notice => "see productions" 
        return
      when "shipment"
        redirect_to dash_board_shipment_path, :notice => "see shipments" 
        return
      when "contract"
        redirect_to dashboard_contract_path, :notice => "see contracts" 
        return
      when "product"
        redirect_to dashboard_product_path, :notice => "see products" 
        return
      when "manufacture"
        redirect_to dashboard_manufacture_path, :notice => "see manufactures" 
        return
      else
    end  
    end
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  
    end
end

end
