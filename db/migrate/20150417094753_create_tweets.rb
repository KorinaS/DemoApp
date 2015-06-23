class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.time :timer

      t.timestamps
    end
  end
end
