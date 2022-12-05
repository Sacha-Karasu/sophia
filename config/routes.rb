Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :rooms, only: [:new, :create, :show, :index, :destroy] do
    resources :messages, only: [:create]
  end
  resources :messages, only: [:destroy]
  get "rooms", to: "rooms#autodestruction"
  get "fav", to: "rooms#fav"
  post "nomade", to: "rooms#nomade"
  post "location", to: "application#location"
end
