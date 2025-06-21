class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :helpful_votes, default: 0
      t.integer :unhelpful_votes, default: 0

      t.timestamps
    end

    add_index :reviews, [ :restaurant_id, :user_id ], unique: true
    add_index :reviews, :rating
    add_index :reviews, :created_at
  end
end
