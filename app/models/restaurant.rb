class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags

  validates :name, presence: true
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  scope :near, ->(lat, lng, distance = 10) {
    where("
      (6371 * acos(
        cos(radians(?)) *
        cos(radians(latitude)) *
        cos(radians(longitude) - radians(?)) +
        sin(radians(?)) *
        sin(radians(latitude))
      )) < ?", lat, lng, lat, distance)
  }

  def average_rating
    reviews.average(:rating)&.round(1) || 0
  end

  def review_count
    reviews.count
  end
end
