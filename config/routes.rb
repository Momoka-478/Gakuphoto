Rails.application.routes.draw do

  resources :posts, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :edit, :update]

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

end
