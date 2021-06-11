Rails.application.routes.draw do
  
  devise_for :users
  root to:'markets#index'
  

  #全てのアクションが揃ったので[: アクション名]の記述を削除しました。
  resources :markets do
    resources :purchases, only: [:index, :create]
  end
end
