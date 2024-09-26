Rails.application.routes.draw do
  get 'pages/show'
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/edit'
  get 'reservations/update'
  get 'reservations/destroy'
  root 'rooms#index'
  devise_for :users
  resources :pages, only: [:show]
  resources :rooms do
    resources :reservations, only: [:new, :create, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
