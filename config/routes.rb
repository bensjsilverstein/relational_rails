Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/foodtrucks', to: 'foodtrucks#index'
  get '/foodtrucks/new', to: 'foodtrucks#new'
  post '/foodtrucks', to: 'foodtrucks#create'
  get '/foodtrucks/:id', to: 'foodtrucks#show'
  get '/foodtrucks/:id/edit', to: 'foodtrucks#edit'
  patch '/foodtrucks/:id', to: 'foodtrucks#update'
  delete '/foodtrucks/:id', to: 'foodtrucks#destroy'
  get '/foodtrucks/:id/dishes', to: 'foodtruck_dishes#index'
  get '/foodtrucks/:id/dishes/new', to: 'foodtruck_dishes#new'
  post '/foodtrucks/:id/dishes', to: 'foodtruck_dishes#create'
  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
  get '/dishes/:id/edit', to: 'dishes#edit'
  patch '/dishes/:id', to: 'dishes#update'
  delete '/dishes/:id', to: 'dishes#destroy'
end
