Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get  "/registration", to: "registration#new"
  post "/registration", to: "registration#create"

  get  "/registration/edit", to: "registration#edit" # for new password UI
  patch "registration/new_password", to: "registration#update" # button change password

  get  "/email_verification", to: "email#new" # for email verification UI
  post "/email_verification", to: "email#create" # for button "verify"

  get    "/auth", to: "auth#new"
  post   "/auth", to: "auth#create"
  delete "/auth", to: "auth#destroy"

  resources :users, controller: 'personal_cabinet', only: [:show] do
    patch 'new_photo', to: "personal_cabinet#change_photo", on: :member
  end

  # get "/forum", to: "forum#index"

  resources :sections, controller: 'forum', only: [:index] do
    resources :topics, controller: 'forum', only: [:show] do
      resources :comments, only: [:create, :destroy] do
        resources :likes, only: [:create, :destroy]
      end
    end
  end

  get "/sections/:section_id/topics", to: "forum#index_topics", as: "section_topics"

  get "/info", to: "info#index"

  get "/support", to: "support#index"

  # will be implemented later
  get "/news", to: "news#index"
  get "/wiki", to: "wiki#index"


end
