class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false, after: :id
    add_column :users, :account, :string, null: false, unique: true, after: :name
    add_column :users, :icon, :string, after: :account
    add_column :users, :image, :string, after: :icon
    add_column :users, :text, :text, after: :image
  end
end
