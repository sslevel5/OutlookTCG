class CreateCardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :card_comments do |t|

      t.timestamps
    end
  end
end
