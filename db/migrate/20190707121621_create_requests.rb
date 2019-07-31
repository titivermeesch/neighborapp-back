class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :user_id
      t.string :type
      t.text :description
      t.date :date
      t.integer :required_people
      t.string :location
      t.string :status
      t.timestamps
    end
  end
end
