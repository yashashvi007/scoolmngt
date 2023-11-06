Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"
  resources :profiles
  get "/login" , to: "sessions#new"
  post "/login" , to: "sessions#create", as: "sessions"
  get "/logout" , to: "sessions#destroy"

  resources :courses do 
    resources :enrollments
  end
end
