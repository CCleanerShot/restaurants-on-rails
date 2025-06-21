class CreateReviewVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :review_votes do |t|
      t.references :review, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :vote_type, null: false

      t.timestamps
    end

    add_index :review_votes, [ :review_id, :user_id ], unique: true
    add_index :review_votes, :vote_type
  end
end
