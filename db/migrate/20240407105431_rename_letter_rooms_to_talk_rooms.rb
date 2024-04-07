class RenameLetterRoomsToTalkRooms < ActiveRecord::Migration[6.1]
  def change
    rename_table :letter_rooms, :talk_rooms
  end
end
