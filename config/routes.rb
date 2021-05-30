Rails.application.routes.draw do
  
  devise_for :users
  root to:'markets#index'
  resources :markets, only: [ :index, :new, :create, :show, :edit, :destroy ] do
  end

end
