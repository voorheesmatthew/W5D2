
Rails.application.routes.draw do
  resources :comments, only: [:create, :show]
  resources :subs, except: :destroy do
    resources :posts, only: :show
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:destroy, :new, :create, :edit, :update, :show] do
    resources :comments, only: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
