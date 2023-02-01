Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "chatroom#home"

  resources :users

  get "login", to: "sessions#new"

  post "login", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  post "chatroom", to: "chatroom#chatroom"

  get "clear", to: "chatroom#clear"

  mount ActionCable.server, at: "/cable"

end
