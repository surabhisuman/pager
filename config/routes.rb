Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :pager, only: [:create]
  post 'map_developer', to: 'team#map_developer'

  post 'alert', to: 'pager#receive_alert'
end
