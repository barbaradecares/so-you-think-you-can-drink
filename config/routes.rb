Rails.application.routes.draw do
  resources :turns
  resources :players
  resources :challenges
  get '/welcome', to: 'application#index', as: 'welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
