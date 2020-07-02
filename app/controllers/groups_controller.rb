class GroupsController < ApplicationController

  def new #データを生成するアクション
    @group = Group.new #ビューにデータを渡す為にインスタンス変数をここで定義しておく.Groupというインスタンスを作成
    @group.users << current_user #グループのユーザーに現在のユーザーを代入する
  end

  def create   #情報を生成し保存してくれるアクション
    binding.pry #gemfileにpry-railsを記述してインストールすることで扱えるようになるgemで、binding.pryがある箇所でrailsの処理を止めておくことができる
  end
  
end
