Rails.application.routes.draw do
  resources :users
  resources :tweets
  resources :likes
  root "top#index"
  
  get "top/main"
  post "top/login"
  get "top/logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
