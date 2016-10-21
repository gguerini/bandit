Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "home#index"

  resources :sections
  resources :race_reports

  get "/:username", to: "dashboard#index", as: :user_dashboard
end
