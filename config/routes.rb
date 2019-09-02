Rails.application.routes.draw do
  devise_for :users
  
  # AG: Devise normally shows "login" page first by default
  # and this is to do the opposite, show first "sign up". Many 
  # social network apps do this instead.  
  devise_scope :user do
    authenticated :user do
      root to: 'users#show'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  # resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
