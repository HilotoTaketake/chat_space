class ApplicationController < ActionController::Base
  before_action  :authenticate_user! #認証されたユーザーグループ名でアクセス権の設定をしている
  before_action  :configure_permitted_parameters,  if: :devise_controller? #もしdeviseのコントローラーがインストールされているなら許可されたパラメーターを設定する

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #deviseで保存ができるのはマイグレーションファイルを生成した時に記述してあるカラムだけでそれ以外を追加する場合にdevise_parameter_sanitizerが必要
  end
end
