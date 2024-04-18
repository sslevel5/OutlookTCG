class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :customer_id
      t.string :title, null: false
      t.text :message, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
