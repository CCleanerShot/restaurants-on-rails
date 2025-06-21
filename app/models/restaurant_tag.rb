class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag
  has_many :tag_votes, dependent: :destroy

  validates :restaurant_id, uniqueness: { scope: :tag_id }

  scope :popular, -> { order(upvotes: :desc) }
  scope :controversial, -> { where("upvotes > 0 AND downvotes > 0").order("(downvotes::float / upvotes::float) DESC") }

  def net_votes
    upvotes - downvotes
  end

  def vote_ratio
    return 0 if upvotes == 0
    downvotes.to_f / upvotes.to_f
  end

  def should_be_removed?
    # Remove if more than 3:1 downvote ratio and at least 5 total votes
    total_votes = upvotes + downvotes
    total_votes >= 5 && vote_ratio > 3.0
  end

  def update_vote_counts!
    self.upvotes = tag_votes.where(vote_type: "up").count
    self.downvotes = tag_votes.where(vote_type: "down").count
    save!

    # Auto-remove if threshold met
    destroy if should_be_removed?
  end
end
