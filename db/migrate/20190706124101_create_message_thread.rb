class CreateMessageThread < ActiveRecord::Migration[5.2]
  def change
    create_table :message_threads do |t|
      t.string :thread_owner
    end
  end
end
