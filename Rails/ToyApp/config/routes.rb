Rails.application.routes.draw do
  resources :cats, only: [:index, :show]
  resources :corgis, only: [:index, :show]
end
