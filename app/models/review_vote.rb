class ReviewVote < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :vote_type, presence: true, inclusion: { in: %w[helpful unhelpful] }
  validates :user_id, uniqueness: { scope: :review_id, message: "can only vote once per review" }

  after_create :update_review_counts
  after_update :update_review_counts
  after_destroy :update_review_counts

  scope :helpful, -> { where(vote_type: "helpful") }
  scope :unhelpful, -> { where(vote_type: "unhelpful") }

  private

  def update_review_counts
    review.update_vote_counts!
  end
end
