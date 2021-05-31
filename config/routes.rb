Rails.application.routes.draw do
  
  devise_for :users
  root to:'markets#index'
  resources :markets, only: [ :index, :new, :create, :show, :edit, :update ] do
  end

end
