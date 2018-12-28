class CreateSentMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_messages do |t|
      t.references :user, foreign_key: true
      t.references :recipient
      t.string :recipient_name
      t.text :content

      t.timestamps
    end
  end
end
