class CreateLetterRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :letter_room_messages do |t|

      t.text :message, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
