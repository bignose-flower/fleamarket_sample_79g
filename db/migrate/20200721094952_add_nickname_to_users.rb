class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users,  :first_name, :string, null: false
    add_column :users,  :family_name, :string, null: false
    add_column :users,  :hurigana_first, :string, null: false
    add_column :users,  :hurigana_family, :string, null: false
    add_column :users,  :birthday, :date, null: false
  end
end
