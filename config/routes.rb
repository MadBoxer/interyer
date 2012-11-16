Interyer::Application.routes.draw do
  namespace :administration do resources :brands end

  namespace :administration do resources :categories end
    
  namespace :administration do resources :products end
    
  get '/administration', :controller => 'administration/categories', :action => 'index'
  get 'category/:id', :controller => 'public/category', :action => 'show', :id => :id
  get '/add_to_cart/:id', :controller => 'public/cart', :action => 'add_to_cart', :id => :id
  get '/products/:prod_ref', :controller => 'public/product', :action => 'show', :prod_ref => :prod_ref
  get '/cart', :controller => 'public/cart', :action => 'show'
  get '/:cat_ref', :controller => 'public/category', :action => 'show', :cat_ref => :cat_ref
  get '/:cat_ref/:prod_ref', :controller => 'public/product', :action => 'show', :cat_ref => :cat_ref, :prod_ref => :prod_ref
  get '/', :controller => 'public/category', :action => 'index'
  #get 'page_not_found', 'public/shared/_not_found.html'
  #get '/administration/categories/show', :controller => 'administration/categories', :action => 'show'
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
