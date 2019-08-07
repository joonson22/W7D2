class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.string :studio, null: false
      t.timestamps
    end
  end
end
