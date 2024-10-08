class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, index: true
      t.string :name, null: false
      t.integer :hunterRank, default: 1
      t.string :gender, null: false, default: 'male'

      t.timestamps
    end
  end
end
