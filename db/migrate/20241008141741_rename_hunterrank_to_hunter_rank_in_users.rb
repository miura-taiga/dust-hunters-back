class RenameHunterrankToHunterRankInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :hunterrank, :hunterRank
  end
end
