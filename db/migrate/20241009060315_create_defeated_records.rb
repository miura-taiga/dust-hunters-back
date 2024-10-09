class CreateDefeatedRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :defeated_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quest, null: false, foreign_key: true
      t.datetime :defeated_at

      t.timestamps
    end
  end
end
