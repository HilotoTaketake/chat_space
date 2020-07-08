class UsersController < ApplicationController

  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit #routes.rbで記述されているのでここで定義できる。編集するためのメソッド
    render :edit #省略されている部分で本当は書かれていない。あってもなくても同じ意味。ビューファイルと繋がるためのメソッドの内容
  end

  def update #更新するためのメソッド
    if current_user.update(user_params) #もし現在のユーザーが更新に成功したら
      redirect_to root_path  #トップページへ遷移するように設定
    else   
      render :edit  #もしパスワードの文字数などで更新失敗したらedit画面へ再度遷移する
    end
  end

  private #意図しないデータの更新を防ぐためのメソッドここ以下のメソッドは全てストロングパラメータになる

  def user_params
    params.require(:user).permit(:name, :email) #受け取りたいキー(情報)を指定する。フォームformタグ、form_with、form＿forの３つがあってその中のformタグ<>はnameとmailが生成した時にすでに入ってい流ので今回あるrequireはいらない。だが残りの２つの場合はパラメータを開けるとnameとmailは入っていなくuserの箱が入っていてその中にnamaとmailがはいいている。今回はform_forなのでnameとmailを取り出すにはuserの箱をrequireで開けた上でnameとmailを取り出す。
  end
end