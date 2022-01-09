Rails.application.routes.draw do
  # 
  get 'transit/home'
  devise_for :users, controllers:{ registrations: 'registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: %i[show index]
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
