class AddTitleColumnToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :title, :string
  end
end
