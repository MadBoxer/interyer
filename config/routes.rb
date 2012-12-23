Interyer::Application.routes.draw do

  namespace :administration do
    resources :news, :except => 'show' do
    end
  end
  namespace :administration do resources :surfaces, :except => 'show' end

  #namespace :public do resources :news end

  scope :module => 'public' do
    resources :news do
      collection do
        get 'index'
        get 'show'
      end
    end
  end

  get 'administration/discounts/get_category_children', :controller => 'administration/discounts', :action => 'get_children'
  get 'administration/discounts/get_category_products', :controller => 'administration/discounts', :action => 'get_products'
  get 'administration/discounts/save_category_products', :controller => 'administration/discounts', :action => 'save_discounts'


  namespace :administration do resources :discounts, :except => 'show' end
  namespace :public do resources :user end
  namespace :administration do resources :orders end
  namespace :public do resources :orders, :except => 'index' end
  namespace :administration do resources :users end
  namespace :administration do resources :advantages, :except => 'show' end
  namespace :administration do resources :actions, :except => 'show' end
  namespace :administration do resources :brands, :except => 'show' end
  namespace :administration do resources :categories end
  namespace :administration do resources :products, :except => 'show' end


  get '/news', :controller => 'public/news', :action => 'index'
  get '/news/:news_ref', :controller => 'public/news', :action => 'show', :news_ref => :news_ref
  get '/search', :controller => 'public/product', :action => 'search'
  get '/login', :controller => 'public/user', :action => 'login'
  get '/unlogin', :controller => 'public/user', :action => 'unlogin'
  get '/register', :controller => 'public/user', :action => 'new'
  post '/reset_cart', :controller => 'public/cart', :action => 'reset_cart'
  post '/register', :controller => 'public/user', :action => 'new'
  get '/cabinet', :controller => 'public/user', :action => 'cabinet'
  post '/authorize', :controller => 'public/user', :action => 'authorize'
  post '/create_order', :controller => 'public/cart', :action => 'create_order'
  post '/add_user', :controller => 'public/user', :action => 'add_user'
  get '/administration', :controller => 'administration/categories', :action => 'index'
  get 'category/:id', :controller => 'public/category', :action => 'show', :id => :id
  get '/add_to_cart/:id', :controller => 'public/cart', :action => 'add_to_cart', :id => :id
  get '/products/:prod_ref', :controller => 'public/product', :action => 'show', :prod_ref => :prod_ref

  get '/cart', :controller => 'public/cart', :action => 'show'
  get '/actions', :controller => 'public/actions', :action => 'index'
  get '/action/:action_name', :controller => 'public/actions', :action => 'show', :action_name => :action_name
  get '/:cat_ref', :controller => 'public/category', :action => 'show', :cat_ref => :cat_ref
  get '/:cat_ref/:prod_ref', :controller => 'public/product', :action => 'show', :cat_ref => :cat_ref, :prod_ref => :prod_ref
  get '/', :controller => 'public/category', :action => 'index'
  get 'cart/delete_from_cart/:product_id', :controller => 'public/cart', :action => 'delete_from_cart', :product_id => :product_id
  get 'page_not_found', :controller => 'application', :action => 'not_found'
  get 'administration/:rest', :controller => 'administration/administration', :action => 'routing_error', :constraints => {rest: /.*/}
  get '*rest', :controller => 'application', :action => 'routing_error'

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
