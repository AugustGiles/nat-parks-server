Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parks, only: [:index, :show]
  resources :states, only: [:index, :show]
  
  post '/users', to: 'users#create'
  post '/login', to: 'auth#login'
  get '/profile', to: 'users#show'
  post '/follow/:id', to: 'users#follow'
  get '/parks/:id/alerts', to: 'parks#alerts'
  get '/parks/:id/events', to: 'parks#events'
  post '/unfollow/:id', to: 'users#unfollow'

end
