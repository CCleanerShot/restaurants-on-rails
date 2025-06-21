class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :tag_votes, dependent: :destroy
  has_many :review_votes, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
