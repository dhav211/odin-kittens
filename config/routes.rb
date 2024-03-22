Rails.application.routes.draw do
  devise_for :owners

  get "up" => "rails/health#show", as: :rails_health_check

  resources :kittens do
    resources :image_posts, only: %i[new show create]
  end

  root 'kittens#index'
end
