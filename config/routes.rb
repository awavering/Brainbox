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
end
