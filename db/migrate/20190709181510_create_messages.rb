class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    drop_table :messages
    create_table :messages do |t|
      t.string :thread_id
      t.string :message_author
      t.datetime :date
      t.text :content
      t.timestamps
    end
  end
end
