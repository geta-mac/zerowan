Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
