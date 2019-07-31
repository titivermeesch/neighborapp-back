class AddAllFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :idcard, :string
  end
end
