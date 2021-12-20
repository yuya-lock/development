class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true  # 外部キー
      t.string :circle_name, null: false                  # サークル名
      t.string :university, null: false                   # 大学名
      t.text :body, null: false                           # 本文

      t.timestamps
    end
  end
end
