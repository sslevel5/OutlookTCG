class RenameNiceToFavorite < ActiveRecord::Migration[6.1]
  def change
    rename_table :nices, :favorites
  end
end
