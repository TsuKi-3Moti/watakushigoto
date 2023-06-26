Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "searches/search" => "searches#search", as: "search"

  root to:       "homes#top"
  get "about" => "homes#about"

  scope module: :public do

    devise_scope :user do
      post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end

    resources :users, only: [:show, :index, :edit, :update] do
      get :favorites, on: :member
    end

    resources :questions, only: [:create, :show, :index, :update, :edit, :destroy] do
      resources :answers, only: [:create, :edit, :update, :destroy]
    end

    resources :answers, only: :index do
      resources :favorites, only: [:create, :destroy], param: :design, constraints: { code: /\d+/ }
    end

    resources :tags, only: :index
  end

  namespace :admin do

    resources :users, only: [:show, :index, :edit, :update] do
      get :favorites, on: :member
    end

    resources :questions, only: [:show, :index, :destroy] do
      resources :answers, only: :destroy
    end

    resources :answers, only: :index

    resources :tags, only: [:index, :destroy], param: :name
  end

end