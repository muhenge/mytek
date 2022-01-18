Rails.application.routes.draw do
  

  get 'transit/home'
  devise_for :users, controllers:{ registrations: 'registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show], param: :slug
  resources :users, only: %i[show index], param: :slug do 
    resources :posts
  end
  resources :comments do 
    resources :users
    resources :posts
  end

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  resources :posts do
    resources :users
    resources :careers
    resources :comments
    member do
      put "like" => "posts#vote"
    end
  end
  
  root :to => "welcome#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
