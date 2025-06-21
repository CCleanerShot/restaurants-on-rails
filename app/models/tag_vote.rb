class TagVote < ApplicationRecord
  belongs_to :restaurant_tag
  belongs_to :user

  validates :vote_type, presence: true, inclusion: { in: %w[up down] }
  validates :user_id, uniqueness: { scope: :restaurant_tag_id, message: "can only vote once per tag" }

  after_create :update_restaurant_tag_counts
  after_update :update_restaurant_tag_counts
  after_destroy :update_restaurant_tag_counts

  scope :upvotes, -> { where(vote_type: "up") }
  scope :downvotes, -> { where(vote_type: "down") }

  private

  def update_restaurant_tag_counts
    restaurant_tag.update_vote_counts!
  end
end
