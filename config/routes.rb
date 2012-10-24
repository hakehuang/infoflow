Infoflow::Application.routes.draw do


  resources :shipments

  devise_for :users

  root :to => "home#index"

  match '/dashboard/customer' => "dashboard#customer"
  match '/dashboard/project' => "dashboard#project"
  match '/dashboard/production' => "dashboard#production"
  match '/dashboard/product' => "dashboard#product"
  match '/dashboard/contract' => "dashboard#contract"
  match '/dashboard/shipment' => "dashboard#shipment"
  match '/dashboard/manufacture' => "dashboard#manufacture"
  match '/contracts/add_product' => "contracts#add_product"
  match '/projects/sub_path' => "projects#sub_path"
  match '/shipments/sub_path' => "shipments#sub_path"
  match "/update_range" => "dashboard#update_range"
  match '/search' => "search_engine#do_search"
  match '/manufactures/add_new_product' => "manufactures#add_new_product"
  match '/manufactures/add_product' => "manufactures#add_product"
  match '/manufactures/add_manufacture' => "manufactures#add_manufacture"

  resources :shipments
  resources :dashboard
  resources :projects
  resources :customers
  resources :contracts
  resources :manufactures
  resources :products
  resources :productions
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
