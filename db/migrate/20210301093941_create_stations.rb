class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :station_id, null: false, unique: true
      t.integer :line_id
      t.string :name
      t.string :address
      t.decimal :lat, :precision => 9, :scale => 6, null: true
      t.decimal :lng, :precision => 9, :scale => 6, null: true
      t.timestamps
    end
  end
end
