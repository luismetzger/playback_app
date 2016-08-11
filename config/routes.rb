Rails.application.routes.draw do
  root :to => "welcome#index", :as => "welcome"

  resources :concerts
  #Auth0 routes
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  resources :paperclip_images
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get '/about-us', to: "welcome#about_us", as: "about_us"
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

end
