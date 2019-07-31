class DeleteThreadUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :thread_user
  end
end
