Rails.application.routes.draw do
  devise_for :users

  resources :orders do
    collection do
      get 'search'
    end
  end

  root to: 'orders#index'
end
