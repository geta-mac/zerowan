Rails.application.routes.draw do
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'base/show'
  end
    get 'posts/index'	
    get 'posts/show'	
    get 'posts/edit'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'  
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'  
  }

  root 'top#index'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :destroy] do
    collection do
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      put "mypage", :to => "users#update"
    end

    namespace :admins do	
      resources :posts	
      resources :users	
      resources :base
      end
  end
end
