Rails.application.routes.draw do
  devise_for :users
  resources :workshares
  root to: "home#index"
  resources :users
  resources :posts
  resources :details
  resources :home
  
  delete 'posts/:id' => 'posts#destroy'

end
