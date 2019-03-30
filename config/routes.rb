Rails.application.routes.draw do
  get 'login/show'

  resources :cards
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
