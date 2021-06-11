Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/ranking' => 'homes#ranking'
  resources :articles
  resources :dogs
  resources :users
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
