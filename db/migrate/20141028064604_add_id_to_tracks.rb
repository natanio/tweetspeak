class AddIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :id, :integer
  end
end
