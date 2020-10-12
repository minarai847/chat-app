Rails.application.routes.draw do
  devise_for :users
  #get 'messages/index'
   root to: "messages#index"
   #ユーザー編集に必要なルーティングは、editとupdate
   resources :users, only: [:edit, :update]
end
