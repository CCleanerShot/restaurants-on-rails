class Tag < ApplicationRecord
  has_many :restaurant_tags, dependent: :destroy
  has_many :restaurants, through: :restaurant_tags
  has_many :tag_votes, through: :restaurant_tags

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :normalize_name

  scope :popular, -> { joins(:restaurant_tags).group("tags.id").order("COUNT(restaurant_tags.id) DESC") }

  def self.find_or_create_by_name(name)
    normalized_name = name.strip.downcase
    find_or_create_by(name: normalized_name)
  end

  private

  def normalize_name
    self.name = name.strip.downcase
  end
end
