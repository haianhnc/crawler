Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  get '/articles/only_like', to: 'articles#only_like'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :sources
  resources :liked_articles
  # resources :users
end
