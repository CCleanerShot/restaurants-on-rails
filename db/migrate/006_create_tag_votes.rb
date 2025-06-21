class CreateTagVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_votes do |t|
      t.references :restaurant_tag, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :vote_type, null: false

      t.timestamps
    end

    add_index :tag_votes, [ :restaurant_tag_id, :user_id ], unique: true
    add_index :tag_votes, :vote_type
  end
end
