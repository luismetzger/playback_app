Rails.application.routes.draw do
  
  #Auth0 routes
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  resources :paperclip_images
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index", as: "welcome"
  get '/about_us', to: "welcome#about_us", as: "about_us"

end
