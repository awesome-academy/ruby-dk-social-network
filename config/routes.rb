Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "home#index"
    resources :posts
    resources :users do
      member do
        resources :relationships
      end
    end
  end
end
