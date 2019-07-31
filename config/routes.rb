Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  devise_for :users, :controllers => { registrations: 'users' }
  resources :sessions, only: [:create, :destroy, :show]
  resources :message_threads, constraints: { id: /[0-z\.]+/ }
  resources :requests, constraints: { id: /[0-z\.]+/ }
  resources :contributions, only: [:index, :show]
  resources :chat_discussions, only: [:show]
  resources :messages, only: [:create, :show]
  resources :participants, only: [:create, :show, :destroy]
  delete 'participants/:id_request/:user_id(.:format)', :to => 'participants#destroy', constraints: { user_id: /[0-z\.]+/ } 
  resources :participant_link, only: [:show], constraints: { id: /[0-z\.]+/ } 
  resources :chat_link, only: [:show], constraints: { id: /[0-z\.]+/ } 
end
