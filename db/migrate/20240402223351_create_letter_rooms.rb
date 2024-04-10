class CreateLetterRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :letter_rooms do |t|

      t.boolean :is_active, null: false, default: true
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
