class CreateCardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :card_comments do |t|

      t.text :comment, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :card_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
