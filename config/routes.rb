Rails.application.routes.draw do
  devise_for :users
  root to:"audios#index"
  resources :users,only: [:show]
  resources :audios
  resources :artists,only: [:show]
  resources :groups do
    resources :chats,only: [:index,:create]
  end
  
end
