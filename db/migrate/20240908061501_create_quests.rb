class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.string :title, null: false, unique: true
      t.text :body
      t.references :monster, foreign_key: true, null: false

      t.timestamps
    end

    add_index :quests, :title, unique: true
  end
end
