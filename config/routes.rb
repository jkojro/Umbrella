Rails.application.routes.draw do
  devise_for :users
  resources :umbrellas, only: [:new, :create, :show] do
    resources :friends, only: [:edit, :update]
  end
  root 'umbrellas#new'
end
