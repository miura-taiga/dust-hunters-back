class AddUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string, null: false, unique: true
    add_index :users, :uid, unique: true
  end
end
