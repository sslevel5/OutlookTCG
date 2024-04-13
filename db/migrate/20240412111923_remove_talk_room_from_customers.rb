class RemoveTalkRoomFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :customers, :talk_room, foreign_key: true
  end
end
