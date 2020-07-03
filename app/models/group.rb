class Group < ApplicationRecord
  has_many :group_users #１対多を表すアソシエーションを定義。
  has_many :users, through: :group_users #中間テーブル(group_users)を通してたくさんのユーザーがいることを表す。
  has_many :messages

  validates :name, presence: true, uniqueness: true #バリデーションでデータを登録する時に一定のルールを儲けることを指している。今回はnameが必ず存在(presence) して
  #必ず同じnameがないことをルールとして設けている
  
  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません'
    end
  end
end
