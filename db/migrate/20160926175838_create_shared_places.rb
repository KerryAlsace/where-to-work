class CreateSharedPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :shared_places do |t|
      t.integer :friend_id
      t.integer :place_id

      t.timestamps
    end
  end
end
