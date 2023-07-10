Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/residents", to: "residents#index"
  get "/residents/:id", to: "residents#show"

  get "/courses", to: "courses#index"
end
