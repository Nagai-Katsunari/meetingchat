Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  post '/micro', to:'microposts#create'
  get '/micro',to:'microposts#new'


  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
  end
  
  resources :users
  resources :microposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
