class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :mail, unique: true
  end
end
