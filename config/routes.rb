Rails.application.routes.draw do
  resources :umbrellas, only: [:new, :create, :show]
  root 'umbrellas#new'
end
