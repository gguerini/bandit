Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "home#index"

  get "/:username", to: "dashboard#index", as: :user_dashboard
end
