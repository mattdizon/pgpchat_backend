Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/profile", to: "users#profile"
    get 'users/:user_id/friendships', to: 'friendships#showFriendship'
    get 'users/:user_id/recieved_messages', to: 'recieved_messages#showRecievedMessages'
    get 'users/:user_id/sent_messages', to: 'sent_messages#showSentMessages'
    resources :users do
        resources :friendships
        resources :recieved_messages
        resources :sent_messages
    end
    resources :friendships
    resources :recieved_messages
    resources :sent_messages
    resources :conversations, only: [:index, :create]
#    resources :messages, only: [:create]
    mount ActionCable.server => '/cable'

end
