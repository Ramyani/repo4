class CreateUserLocations < ActiveRecord::Migration[5.2]
  def up
    create_table :user_locations do |t|
      t.integer :user_id, null: false
      t.boolean :is_public, null: false, default: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false

      t.timestamps
    end

    add_foreign_key :user_locations, :users
  end

  def down
    drop_foreign_key :user_locations, :users
    drop_table :user_locations
  end
end
