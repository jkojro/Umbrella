Rails.application.routes.draw do
  devise_for :users
  resources :umbrellas, only: [:new, :create, :show]
  root 'umbrellas#new'
end
