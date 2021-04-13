Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :posts, only: [:edit, :update]
  end
  resources :posts, only: [:create, :new, :show, :index, :destroy] do 
    resources :comments, only: [:new]
  end
  resources :subs
  resources :comments, only: [:create]
  resource :session, only: [:create, :new, :destroy]
end
