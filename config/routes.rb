Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"audios#index"
  
  resources :audios
  resources :groups do
    resources :chats,only: [:index,:create]
  end

end
