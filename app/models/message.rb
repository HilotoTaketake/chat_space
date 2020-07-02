class Message < ApplicationRecord
  belongs_to :group #多対1の関係を表すアソシエーション。
  belongs_to :user

  validates :content, presence: true, unless: :image? #unless: :image?はimageカラムがからなら、の意味。→imageカラムが空なら
  mount_uploader :image, ImageUploader #imageはカラム名,Imageuploaderはcarrierwaveの設定ファイルのクラス名
end