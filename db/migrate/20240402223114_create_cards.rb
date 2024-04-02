class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
            
      t.string :title, null: false
      t.text :body, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
