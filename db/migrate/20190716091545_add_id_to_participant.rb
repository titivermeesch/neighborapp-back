class AddIdToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :id, :primary_key
  end
end
