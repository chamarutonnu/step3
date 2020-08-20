Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :users
  root 'homes#top'
  get 'homes/about'

  resources :post_images do
  	resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  get 'user_withdrawal' => 'users#withdrawal', as: 'user_withdrawal'
  patch 'user/:id/hide' => 'users#hide', as: 'user_hide'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
