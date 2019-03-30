class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.text :message
      t.string :username
      t.integer :chat_id

      t.timestamps
    end
  end
end
