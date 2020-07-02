class CreateGroupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_users do |t|
      t.references :group, foreign_key: true #refarence は中間テーブル特有のカラムの型で他のテーブルへの外部キーの定義。_idがついた整数。
      t.references :user, foreign_key: true  #(上記の続き)foreign_key: trueは外部キー制約といって外部キーが他のテーブルの主キーとして必ず存在することを約束する定義。また、refarenceだとforeign_key: trueになるがrefarenceを使わないなら外部キー制約はindex trueになる
      t.timestamps
    end
  end
end
