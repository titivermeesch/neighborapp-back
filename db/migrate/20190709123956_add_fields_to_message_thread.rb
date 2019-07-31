class AddFieldsToMessageThread < ActiveRecord::Migration[5.2]
  def change
    add_column :message_threads, :id_request, :string
  end
end
