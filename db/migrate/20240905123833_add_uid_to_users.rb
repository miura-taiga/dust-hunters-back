class AddUidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string, null: true, unique: true

    User.reset_column_information

    User.find_each do |user|
      user.update!(uid: SecureRandom.hex(10))
    end

    change_column_null :users, :uid, false

    add_index :users, :uid, unique: true
  end
end
