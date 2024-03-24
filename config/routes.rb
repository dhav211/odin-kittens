Rails.application.routes.draw do
  devise_for :owners

  get "up" => "rails/health#show", as: :rails_health_check

  resources :kittens do
    resources :image_posts, only: %i[new show create destroy edit update]
    resources :followers, only: %i[create destroy]
  end

  patch '/kittens/:kitten_id/set_main_image/:id', to: 'kittens#set_main_image', as: 'set_kitten_main_image'

  root 'kittens#index'
end
