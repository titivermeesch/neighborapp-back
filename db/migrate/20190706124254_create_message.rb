class CreateMessage < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :thread_id
      t.datetime :date
      t.text :message
    end
  end
end
