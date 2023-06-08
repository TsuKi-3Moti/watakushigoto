Rails.application.routes.draw do

  devise_for :user, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions:      "user/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end