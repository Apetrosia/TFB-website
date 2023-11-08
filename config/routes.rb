Rails.application.routes.draw do
  resources :registrations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  # resources :registrations

  get  "/registration", to: "registration#new"
  post "/registration", to: "registration#create"

  get  "/registration/edit", to: "registration#edit" # for new password UI
  post "registration/new_password", to: "registration#update"

  get  "/email_verification", to: "email#new" # for email verification UI
  post "/email_verification", to: "email#create" # for button "verify"

  get    "/auth", to: "auth#new"
  post   "/auth", to: "auth#create"
  delete "/auth", to: "auth#destroy"

  get "/user/:id", to: "personal_cabinet#index"

=begin
  resources :cabinets do
    resources :photos
  end
=end

  get  "/user/:id/photo/new", to: "photo#new"
  post "/user/:id/photo/new", to: "photo#update"

  get "/forum", to: "forum#index"

  get "/info", to: "info#index"

  get "/support", to: "support#index"

  # will be implemented later
  get "/news", to: "news#index"
  get "/wiki", to: "wiki#index"


end
