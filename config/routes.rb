Rails.application.routes.draw do
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'base/show'
  
    get 'posts/index'	
    get 'posts/show'	
    get 'posts/edit'
  end
  
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

  resources :users, only: [:show, :edit, :update, :destroy] do
    get :favorites, on: :collection
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

  resources :pets do
    resource :favorites, only: [:create, :destroy]
  end

  resources :top, only: [:index, :show] do
    collection do
      get 'search', as: 'search'
    end
  end

  resources :reactions, only: [:create]
  resources :matching, only: [:index]
  resources :chat_rooms, only: [:create, :show]

end
