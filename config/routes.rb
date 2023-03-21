Rails.application.routes.draw do
  resources :comments
  # collection do
  #   get :search
  # end

  resource :profile, only: [:update]

  resources :posts 
    # collection do
    #   get :search
    # end
  get '/current_user', to: 'current_user#index'
  get '/subscribers', to: 'current_user#get_subscribers'
  get '/subscribees', to: 'current_user#get_subscribees'
  post '/user_on_post', to: 'current_user#getUserOnPost'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
    # collection do
    #   get :search
    # end
  },

  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Defines the root path route ("/")
  # root "articles#index"
end
