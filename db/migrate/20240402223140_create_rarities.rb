class CreateRarities < ActiveRecord::Migration[6.1]
  def change
    create_table :rarities do |t|

      t.string :name, null: false
      t.timestamps
    end
  end
end
