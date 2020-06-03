class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.text  :message
      t.string :image

      t.timestamps
    end
  end
end
