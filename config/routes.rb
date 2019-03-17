Rails.application.routes.draw do
  resources :umbrellas, only: [:show, :new]
end
