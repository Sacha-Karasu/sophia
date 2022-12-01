Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :rooms, only: [:new, :create, :show, :index, :destroy] do
    resources :messages, only: [:create, :destroy]
  end
  get "rooms", to: "rooms#autodestruction"
  post "nomade", to: "rooms#nomade"
end
