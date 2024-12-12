class RemoveBodyFromMonsters < ActiveRecord::Migration[7.0]
  def change
    remove_column :monsters, :body, :text
  end
end
