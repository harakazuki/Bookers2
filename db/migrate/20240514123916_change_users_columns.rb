class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, limit: 20
    change_column :users, :introduction, :string, limit: 50
    add_index :users, :name, unique: true
  end
end
