class CreateNices < ActiveRecord::Migration[6.1]
  def change
    create_table :nices do |t|
      t.integer :card_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
