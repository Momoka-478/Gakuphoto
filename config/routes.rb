Rails.application.routes.draw do

  get 'searches/search'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  resources :posts, only: [:index, :show] do
    resources :favorite, only: [:create, :destroy]
  end

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :destroy]
    resources :admins, only: [:show, :edit, :update]
    resources :posts
  end

  devise_for :users

  root to: "homes#top"
  get 'about', to: 'homes#about', as: :about
  resources :users, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
