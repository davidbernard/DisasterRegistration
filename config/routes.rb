Rails.application.routes.draw do


  devise_for :users
  resources :users

  get 'stream/registrations' => 'stream#registrations'
  resources :stream

  resources :service_providers do
    member do
      get 'add_person'
    end
    resources :people, only: [:edit]
  end

  get 'session/login'
  post 'session/login' => 'session#do_login'
  get 'session/logout'

  resources :people, only: [:show, :create, :update, :new, :edit]

  root :to => 'welcome#index'
  get 'checklist' => 'welcome#checklist'

end
