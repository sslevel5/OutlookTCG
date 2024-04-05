class RemoveUsernameFromCustomers < ActiveRecord::Migration[6.1]
  def up
    remove_column :customers, :username
  end

  def down
    add_column :customers, :username, :string
  end
end
