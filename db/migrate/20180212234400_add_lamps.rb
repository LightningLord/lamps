class AddLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :name, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :status, null: false, default: 0
      t.timestamps
    end
    add_index :lamps, :name, unique: true
    add_index :lamps, [:latitude, :longitude], unique: true
  end
end
