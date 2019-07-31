class AddXAndYToRequest < ActiveRecord::Migration[5.2]
  def change
    rename_column :requests, :location, :x
    add_column :requests, :y, :string
  end
end
