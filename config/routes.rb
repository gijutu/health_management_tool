Rails.application.routes.draw do
  resources :signs
  resources :worse_conditions
  resources :attentions
  resources :better_conditions
  resources :diaries
  devise_for :users
  get 'home/index'
  get 'home/show'

  root to: "home#index"
  post '/callback' => 'linebot#callback'
end
