Rails.application.routes.draw do
  devise_for :users
  root to:"audios#index"
  resources :users
  resources :audios do
    resources :comments,only: [:create]
    namespace :api do
      resources :comments, only: :index, defaults: { format: 'json' }
    end
  end
  resources :artists
  resources :groups do
    resources :chats,only: [:index,:create]
end
end
