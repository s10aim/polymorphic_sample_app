Rails.application.routes.draw do
  resources :posts, only: %i[index create show] do
    resources :comments, only: [:create]
  end
  resources :movies, only: %i[index create show] do
    resources :comments, only: [:create]
  end
end
