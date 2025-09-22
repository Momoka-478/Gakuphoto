Rails.application.routes.draw do

  get 'admins/show'
  get 'searches/search'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  resources :posts, only: [:index, :show] do
    resource :favorite, only: [:create, :destroy]
  end

  resources :admins, only: [:index, :show]

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :show, :destroy]
    resources :admins, only: [:show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :new, :create, :destroy, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  devise_for :users

  root to: "homes#top"
  get 'about', to: 'homes#about', as: :about
  resources :users, only: [:show, :edit, :update, :destroy]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
