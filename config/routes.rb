Rails.application.routes.draw do

  resources :users
  resources :tasks
  resources :messages
end

