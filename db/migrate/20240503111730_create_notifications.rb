class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :message
      t.boolean :read

      t.timestamps
    end
  end
end
