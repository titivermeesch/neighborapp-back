class ChangeTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :type, :request_type
  end
end
