class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :review_votes, dependent: :destroy

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true
  validates :title, presence: true
  validates :user_id, uniqueness: { scope: :restaurant_id, message: "can only review a restaurant once" }

  scope :recent, -> { order(created_at: :desc) }
  scope :by_rating, ->(rating) { where(rating: rating) }

  def helpful_score
    helpful_votes - unhelpful_votes
  end

  def update_vote_counts!
    self.helpful_votes = review_votes.where(vote_type: "helpful").count
    self.unhelpful_votes = review_votes.where(vote_type: "unhelpful").count
    save!
  end
end
