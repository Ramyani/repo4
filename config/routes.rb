Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do
      root to: "home#index"
    end
  end

  resources :users, only: [:show] do
    member do
      post :share_location
    end
  end
end
