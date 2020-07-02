class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content #文字列系
      t.string :image #写真もstringなのは知らなかった
      t.references :group, foreign_key: true #外部キーが入るのでreferences
      t.references :user, foreign_key:true #外部キーが入るのでreferences
      t.timestamps
    end
  end
end
