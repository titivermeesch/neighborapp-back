class CreateThreadUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :thread_users, id: false do |t|
      t.string :thread_id
      t.string :user_id
    end
  end
end
