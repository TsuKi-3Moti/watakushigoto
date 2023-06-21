Rails.application.routes.draw do

  namespace :admin do
    get 'tags/index'
  end
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get "searches/search" => "searches#search", as: "search"

  scope module: :public do

    root to:       "homes#top"
    get "about" => "homes#about", as: "about"

    resources :users, only: [:show, :edit, :update] do
      collection do
        post "unsubscribe"
        get  "withdraw"
        get  "favorites"
      end
    end

    resources :questions, only: [:create, :show, :index, :update, :edit, :destroy] do
      resources :answers, only: [:create, :edit, :update, :destroy]
    end

    resources :answers, only: [:index] do
      post "favorites/:design" => "favorites#create", as: "favorites"
      delete "favorites/:design" => "favorites#destroy", as: "favorites_destroy"
    end

    get "tags" => "tags#index", as: "tags"

  end

  namespace :admin do

    root to: "homes#top"

    resources :users, only: [:show, :index, :edit, :update]

    resources :questions, only: [:show, :index, :destroy] do
      resources :answers, only: [:destroy]
    end

    resources :answers, only: [:index]

    get "tags" => "tags#index", as: "tags"

  end

end