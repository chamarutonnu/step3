Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root 'homes#top'
  get 'homes/about'
  get 'homes/search_category'
  get 'homes/search_season'

  get 'relationships/create'
  get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'

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
