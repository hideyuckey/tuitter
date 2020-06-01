class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, after: :id
    add_column :users, :icon, :string, after: :username
    add_column :users, :image, :string, after: :icon
    add_column :users, :text, :text, after: :image
  end
end
