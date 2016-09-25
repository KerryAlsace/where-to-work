class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :place_type
      t.string :neighborhood
      t.string :address
      t.text :comments
      t.boolean :wifi
      t.string :wifi_quality
      t.boolean :public_restroom
      t.string :restroom_cleanliness
      t.boolean :costs_money
      t.string :available_for_purchase
      t.integer :user_id

      t.timestamps
    end
  end
end
