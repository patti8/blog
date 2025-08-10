Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :articles, except: :index
    get "/", to: "articles#index"
  end
  # resources :articles
  # get "articles/index"
  resources :articles, param: :slug, only: [:index, :show]
  # get "articles/show"
  namespace :api do
      namespace :v1 do
        resources :articles, only: [:index, :show], param: :slug
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "articles#index"
end
