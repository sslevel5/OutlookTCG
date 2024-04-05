class AddUsernameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :username, :string
    add_index :customers, :username, unique: true
  end
end
