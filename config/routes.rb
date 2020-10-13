Rails.application.routes.draw do
  devise_for :users
  #get 'messages/index'
   root to: "rooms#index"
   #ユーザー編集に必要なルーティングは、editとupdate
   resources :users, only: [:edit, :update]
   #新規チャットルームに必要なアクションはnewとcreateだけなので
   resources :rooms, only: [:new, :create]
end
