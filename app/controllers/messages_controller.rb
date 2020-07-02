class MessagesController < ApplicationController
  before_action :set_group

  def index #メッセージを一覧表示送信するアクション
    @message = Message.new #Messageインスタンスを生成しインスタンス変数に代入
    @messages = @group.messages.includes(:user) #(微妙)表示するときにユーザー情報もつけるのでN+1問題が発生するのを防ぐためにincludesを利用してuserテーブルと結びつけている
  end

  def create #メッセージを保存するアクション
    @message = @group.messages.new(message_params) #わからないがインスタンスを生成してインスタンス変数を代入しているのはわかる
    if @message.save #もしメッセージを保存できたら
      redirect_tp group_message_path(@group), notice: 'メッセージが送信されました' #グループのメッセージ一覧にいきフラッシュメッセージを通知。かっこがわからない
    else #もし失敗したら
      @messages = @group.messages.includes(:user) #わからないがincludesでN+1問題を防いでいるのはわかる
      flash.now[:alert] = 'メッセージを入力してください' #フラッシュメッセージを通知
      render :index #4行目に戻る
  end
end

private #クラス外から呼び出すことのできないメソッドでprivate以下はストロングパラメータ(特定のキーを持つパラメータのみ受け取るようにするもの)

 def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id) #formタグ以外のformを利用しているのでrequireでパラメータの中の箱を開けて必要なデータを取り出す。mergeはハッシュを統合させるメソッド
 end

 def set_group #二行目のbefore_actionに呼び出される
  @group = Geoup.find(params[:group_id]) #呼び出されたことでmessageコントローラー内のアクションで@groupを利用できるようになった
 end
end