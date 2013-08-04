Brainbox::Application.routes.draw do
  get "preferences/index"

  get "preferences/edit", :as => :preferences

  resources :comments
  resources :calendar_events
  resources :super_files do
    collection do
      post 'create_many', :action => 'create_many'
    end
  end
  resources :sections do
    resources :assignments do
      resources :submissions
    end
  end
  resources :courses
  resources :schools

  get "help" => "help#index"
  get '/' => "home#index", :as => :home

  devise_for :users, :controllers => { 
    :confirmations => "confirmations",
    :passwords => "passwords",
    :registrations => "registrations",
    :sessions => "sessions",
  }

  # user entry points
  get '/admin/users' => "users#index", :as => :users
  get '/admin/users/new' => "users#new", :as => :new_user
  post '/admin/users/create' => "users#create", :as => :create_user
  get '/admin/users/edit' => "users#edit", :as => :edit_user
  patch '/admin/users/update' => "users#update", :as => :update_user
  get '/admin/users/:id' => "users#show", :as => :show_user

  get "home/index"

  root :to => "home#index"

  post 'feedback/create' => 'feedback#create', :as => 'feedback'
  get 'manage_courses' => 'sections#index', :as => 'manage_courses'

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
