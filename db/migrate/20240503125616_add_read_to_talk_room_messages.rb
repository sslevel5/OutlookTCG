class AddReadToTalkRoomMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :talk_room_messages, :read, :boolean, default: false
  end
end
