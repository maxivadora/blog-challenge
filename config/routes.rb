Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %i[index show] do
    resources :comments, only: %i[create]
  end

  namespace :admins do
    resources :posts, only: %i[new create]
  end
end
