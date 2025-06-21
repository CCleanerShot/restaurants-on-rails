class CreateRestaurantTags < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_tags do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0

      t.timestamps
    end

    add_index :restaurant_tags, [ :restaurant_id, :tag_id ], unique: true
    add_index :restaurant_tags, :upvotes
    add_index :restaurant_tags, :downvotes
  end
end
