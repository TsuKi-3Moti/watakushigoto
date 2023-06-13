Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions:      "public/sessions"
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

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

    resources :answers, only: [] do
      resource :favorites, only: [:create, :destroy]
      get "tags" => "relationships#tags", as: "tags", on: :collection
    end

    resources :relationships, only: [:create, :update, :destroy]

  end

  namespace :admin do

    root to: "homes#top"

    resources :users, only: [:show, :index, :edit, :update]

    resources :questions, only: [:show, :index, :destroy] do
      resources :answers, only: [:update, :destroy]
    end

    resources :relationships, only: [:index, :update, :destroy]

  end

end