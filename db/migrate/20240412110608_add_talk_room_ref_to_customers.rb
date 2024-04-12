class AddTalkRoomRefToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :talk_room, null: false, foreign_key: true
  end
end
