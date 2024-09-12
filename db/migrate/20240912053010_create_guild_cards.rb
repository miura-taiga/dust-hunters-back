class CreateGuildCards < ActiveRecord::Migration[7.0]
  def change
    create_table :guild_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :monster, null: false, foreign_key: true
      t.references :quest, foreign_key: true
      t.integer :defeat_count, default: 0

      t.timestamps
    end
    add_index :guild_cards, %i[user_id monster_id], unique: true
  end
end
