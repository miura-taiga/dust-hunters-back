class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.string :start_battle_image_url
      t.string :end_battle_image_url
      t.string :bestiary_monster_image_url

      t.timestamps
    end

    add_index :monsters, :name, unique: true
  end
end
