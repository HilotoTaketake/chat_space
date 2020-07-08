Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#index' #トップペー(localhost3000)を見たい時に使われるメソッドrootを使ってmessagesコントローラーでindex(一覧表示)をするよう指示出ししている
  resources :users, only: [:index, :edit, :update] #users_controllerファイルの中のアクションを呼び出す為にここで記述する
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]#メッセージの一覧、入力をするindexとメッセージの保存ができるcreate

    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
end
