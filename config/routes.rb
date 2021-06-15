Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'homes/ranking' => 'homes#ranking'
  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end
  resources :dogs
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
