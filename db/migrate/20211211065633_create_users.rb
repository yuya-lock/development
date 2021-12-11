class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false # 名前
      t.string :mail, null: false # メールアドレス
      t.string :password, null: false # パスワード
      t.boolean :is_host, null: false, default: false # チケット作成者のチケット管理権限
      t.string :top_image # トップ画像
      t.string :back_image # 背景画像

      t.timestamps
    end
  end
end
