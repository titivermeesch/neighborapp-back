class AddTitleToMessageThread < ActiveRecord::Migration[5.2]
  def change
    add_column :message_threads, :title, :string
  end
end
