class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false             # ユーザー名
      t.string :mail, null: false             # メールアドレス
      t.string :password_digest, null: false  # パスワード

      t.timestamps
    end
  end
end
