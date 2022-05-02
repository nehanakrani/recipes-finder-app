Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes, only: [:index, :show] #no html pages needed
  resources :ingredients, only: [:show]
end
