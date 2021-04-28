Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users
  resources :spas do
    resource :spa_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get '/search' => 'search#search'
end
