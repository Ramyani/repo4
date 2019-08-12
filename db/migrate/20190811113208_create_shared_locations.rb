class CreateSharedLocations < ActiveRecord::Migration[5.2]
  def up
    create_table :shared_locations do |t|
      t.integer :user_location_id, null: false
      t.integer :user_id, null: false
      t.index :user_location_id
      t.index :user_id

      t.timestamps
    end

    add_foreign_key :shared_locations, :user_locations
    add_foreign_key :shared_locations, :users
  end

  def down
    remove_foreign_key :shared_locations, :user_locations
    remove_foreign_key :shared_locations, :users
    drop_table :shared_locations
  end
end
