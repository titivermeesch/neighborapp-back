class RenameTableNameFromParticipants < ActiveRecord::Migration[5.2]
  def change
    rename_table :participants_tables, :participants
  end
end
