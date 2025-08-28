Rails.application.routes.draw do

  get 'searches/search'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :admins, only: [:show, :edit, :update]
  end

  devise_for :users

  root to: "homes#top"
  get 'about', to: 'homes#about', as: :about
  resources :users, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
