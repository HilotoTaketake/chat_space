class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false #カラムの型には文字列が入るようにstringを記入。長文ならtextを入れる。カラム名は必ずシンボルにする。null falseは空にすることを防ぐ制約
      t.index :name, unique: true #このカラムの型はテーブル内のデータの検索を高速にするための仕組みを持つ。インデックスを貼るという。今回はnameカラムにインデックスを張っているので名前を検索する機能の速度が上がるように設定している。unique true制約でnameカラムに同じ名前が入るのを防ぐ
      t.timestamps
    end
  end
end
