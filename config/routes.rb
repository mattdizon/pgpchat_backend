Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/profile", to: "users#profile"
    get 'users/:user_id/friendships', to: 'friendships#showFriendship'
    resources :users do
        resources :friendships
    end
    resources :friendships
    resources :conversations, only: [:index, :create]
    resources :messages, only: [:create]
    mount ActionCable.server => '/cable'

end
