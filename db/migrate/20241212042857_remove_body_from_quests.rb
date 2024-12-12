class RemoveBodyFromQuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :quests, :body, :text
  end
end
