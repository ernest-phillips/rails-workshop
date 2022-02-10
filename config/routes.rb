Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/movies", to: "movies#index", as: "movies"
  # post "/movies", to: "movies#create"
  # get "/movies/new", to: "movies#new", as: "new_movie"
  # get "/movies/:id", to: "movies#show", as: "movie"

  resources :movies
end
