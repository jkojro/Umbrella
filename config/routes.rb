Rails.application.routes.draw do
  devise_for :users
  resources :umbrellas do
    resources :friends, only: [:show, :edit, :update]
  end
  root 'umbrellas#new'
end
