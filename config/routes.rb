Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'gossips#index'
  resources :gossips

  get '/new', to: 'gossips#new'

  get '/edit', to:'gossips#update'

end
