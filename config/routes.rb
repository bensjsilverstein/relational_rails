Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/foodtrucks', to: 'foodtrucks#index'
  get '/foodtrucks/:id', to: 'foodtrucks#show'
  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
end
