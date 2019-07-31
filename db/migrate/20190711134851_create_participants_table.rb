class CreateParticipantsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :participants_tables, id: false do |t|
      t.string :id_request
      t.string :user_id
    end
  end
end
