Rails.application.routes.draw do
  
  devise_for :users
  root to:'markets#index'
  resources :markets do
  end
end
