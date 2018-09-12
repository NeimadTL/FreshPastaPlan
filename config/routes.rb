Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'catalog#index'
  get 'catalog' => 'catalog#index'
  resources :subscriptions, only: [:index]
end
