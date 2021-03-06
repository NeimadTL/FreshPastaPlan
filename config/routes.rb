Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'catalog#index'
  get 'catalog' => 'catalog#index'
  resources :users_subs_relationships, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :create]
end
