Rails.application.routes.draw do

  resource :me, only: [:update, :edit], controller: :me
  resources :users, only: [:index, :show]

  resources :cards do
    member do
      post :subscribe
      post :unsubscribe
    end
  end

  resources :login

  get 'tags_users/insert'

  get 'tags_users/delete'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:index]

  root to: redirect("cards#path")
end
