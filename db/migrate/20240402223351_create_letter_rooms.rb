class CreateLetterRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :letter_rooms do |t|

      t.timestamps
    end
  end
end
