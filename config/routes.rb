Rails.application.routes.draw do
  devise_for :owners
  resources :owners, only: %i[show] do
    resources :kittens do
      resources :image_posts, only: %i[new show create destroy edit update]
      resources :followers, only: %i[create destroy]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  patch 'owners/:owner_id/kittens/:kitten_id/set_profile_picture/:id', to: 'kittens#set_profile_picture', as: 'set_kitten_profile_picture'
  get 'owners/:id/feed', to: 'owners#show_feed', as: 'show_owner_feed'
  root 'owners#index'
end
