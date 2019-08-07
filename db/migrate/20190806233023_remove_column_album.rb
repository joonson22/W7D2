class RemoveColumnAlbum < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :album
  end
end
