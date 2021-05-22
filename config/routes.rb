Rails.application.routes.draw do
  
  #get 'markets/index'
  #get 'market/index'
  #get 'tops/index'
  devise_for :users
  root to:'markets#index'
  resources :markets, only: [:new, :create] do
  end

end
