Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'about', to: 'pages#about'
  root 'pages#home'
end
