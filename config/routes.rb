Rails.application.routes.draw do 
  devise_for :users, controllers: {seessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'accounts', to: 'users/registrations#new_account'
    post 'accounts', to: 'users/registrations#create_account'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"

  resources :items, only: [:index, :show]
  resources :homes, only: [:new]
end
