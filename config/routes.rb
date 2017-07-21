Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "home#index"

  resources :sections
  resources :race_reports

  get "/dashboard", to: "dashboard#index", as: :dashboard
  get "/:id", to: "profile#index", as: :profile
  get "/:id/:race_id", to: "profile#show", as: :race_report_profile
end
