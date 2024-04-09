Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # ActiveAdmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # Website routes
  filter :locale, :exclude => /^\/admin/

  # Defines the root path route ("/")
  root "articles#index"

  get 'news', to: 'articles#news_category', as: :news_category
  get 'articles', to: 'articles#articles_category', as: :articles_category
  resources :articles, only: [:index, :show] do
    collection do
      get :feed, to: 'articles#feed'
      get :search, to: 'articles#search'
    end
  end
end
