class CreateMessageThreads < ActiveRecord::Migration[5.2]
  def change
    drop_table :message_threads
    create_table :message_threads do |t|
      t.string :thread_owner

      t.timestamps
    end
  end
end
