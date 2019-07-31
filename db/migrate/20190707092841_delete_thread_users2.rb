class DeleteThreadUsers2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :thread_user
  end
end
