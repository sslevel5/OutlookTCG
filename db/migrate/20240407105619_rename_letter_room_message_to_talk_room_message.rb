class RenameLetterRoomMessageToTalkRoomMessage < ActiveRecord::Migration[6.1]
  def change
    rename_table :letter_room_messages, :talk_room_messages
  end
end
