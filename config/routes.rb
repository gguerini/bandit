Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root "home#index"

  resources :sections
  resources :race_reports

  get "/dashboard", to: "dashboard#index", as: :dashboard
  get "/:id", to: "profile#index", as: :profile
  get "/:id/:race_id", to: "profile#show", as: :race_report_profile
end
