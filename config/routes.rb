Rails.application.routes.draw do
  devise_for :users

  resources :homes

  resources :posts do
    resources :comments
  end

  resources :articles do
    resources :comments
  end

  root to: "homes#index"
end
