Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "messages#index" #トップペー(localhost3000)を見たい時に使われるメソッドrootを使ってmessagesコントローラーでindex(一覧表示)をするよう指示出ししている
  resources :users, only: [:edit, :update] #users_controllerファイルの中のアクションを呼び出す為にここで記述する
  resources :groups,only: [:new, :create, :edit, :update] #groups_controllerファイルの中のアクションを呼び出す為にここで記述する
  resources :messages,only: [:index, :create] #メッセージの一覧表示、メッセージの入力ができるindex。メッセージの保存ができるcreate。
end
