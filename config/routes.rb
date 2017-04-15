Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, skip: [:registrations]
  as :user do
    get '/sign_up' => 'devise/registrations#new', as: 'new_user_registration'
    post 'users' => 'devise/registrations#create', as: 'user_registration'
  end
  resources :users
end
