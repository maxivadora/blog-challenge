Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %i[index show]

  namespace :admins do
    resources :posts, only: %i[new create]
  end
end
