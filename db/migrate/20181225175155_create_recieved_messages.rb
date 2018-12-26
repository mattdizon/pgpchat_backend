class CreateRecievedMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :recieved_messages do |t|
      t.references :user, foreign_key: true
      t.references :sender
      t.text :content

      t.timestamps
    end
  end
end
