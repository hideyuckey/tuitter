class AddColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :good, :integer, after: :image
  end
end
