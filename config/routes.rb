Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :users, :only => [:show]
  root to: 'events#index'
  resources :events
  resources :enrollments, only: [:create]
end
