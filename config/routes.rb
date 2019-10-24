Rails.application.routes.draw do
  root to: "kittens#index"
  get "create_kitten", to: "kittens#new"
  post "create_kitten", to: "kittens#create"
  resources :kittens, only: [:index, :destroy, :edit, :update, :show]
end
