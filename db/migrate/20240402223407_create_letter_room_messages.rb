class CreateLetterRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :letter_room_messages do |t|

      t.timestamps
    end
  end
end
