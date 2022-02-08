Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/movies/:id', to: 'movies#show', as: 'movie'
end
