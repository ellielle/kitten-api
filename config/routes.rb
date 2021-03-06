Rails.application.routes.draw do
  root to: "kittens#index"
  get "create_kitten", to: "kittens#new"
  post "create_kitten", to: "kittens#create"
  delete "delete_kitten", to: "kittens#destroy"
  patch "update", to: "kittens#update"
  resources :kittens, only: [:index, :edit, :update, :show]
end
