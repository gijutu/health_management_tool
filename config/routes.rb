Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  get 'diaries/transition'
  resources :signs
  resources :worse_conditions
  resources :attentions
  resources :better_conditions
  resources :diaries
  devise_for :users

  root to: "home#index"
  post '/callback' => 'linebot#callback'
end
