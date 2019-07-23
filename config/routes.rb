Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "home#index"
    resources :posts do
      resources :likes
      resources :comments
    end
    resources :finds
    get "/edit-password" => "users#edit_password"
    resource :comments
    resources :users do
      resources :notifications
      member do
        resources :relationships
      end
    end
  end
  mount ActionCable.server => "/cable"
end
