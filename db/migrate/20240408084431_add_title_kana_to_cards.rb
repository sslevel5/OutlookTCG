class AddTitleKanaToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :title_kana, :string
  end
end
