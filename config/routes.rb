Rails.application.routes.draw do
  get 'pages/show'
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  get 'reservations/create'
  get 'reservations/edit'
  get 'reservations/update'
  get 'reservations/destroy'
  get '/account/settings', to: 'users#settings', as: 'account_settings'
  patch '/account/settings', to: 'users#update_settings', as: 'update_account_settings'
  get 'search', to: 'rooms#search'
  get 'users/settings', to: 'users#settings', as: 'edit_user_settings'
  get 'account/edit', to: 'users#edit_account', as: 'edit_account'
  patch 'account/edit', to: 'users#update_account', as: 'update_account'
  get 'profile/edit', to: 'users#edit_profile', as: 'edit_profile'
  patch 'profile/edit', to: 'users#update_profile', as: 'update_profile'
  get 'rooms/:room_id/reservations', to: 'reservations#index', as: 'room_reservations'
  root 'rooms#index'
  devise_for :users
  resources :rooms, only: [:index, :show, :new, :create]
  resources :pages, only: [:show]
  resources :reservations
  resources :rooms do
    resources :reservations do
      member do
        get 'confirmation', to: 'reservations#reservation_confirmation'
      end
    end  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
