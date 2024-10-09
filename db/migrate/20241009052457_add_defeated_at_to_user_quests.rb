class AddDefeatedAtToUserQuests < ActiveRecord::Migration[7.0]
  def change
    add_column :user_quests, :defeated_at, :datetime
  end
end
