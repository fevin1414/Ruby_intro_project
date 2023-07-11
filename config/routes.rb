Rails.application.routes.draw do
  root to: 'matches#index'
  resources :matches, only: [:index, :show]
end
