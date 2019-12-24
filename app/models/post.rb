class Post < ApplicationRecord
  has_many :likes, as: :duty
  belongs_to :user
  has_many :comments
  validates :message, presence: true
  paginates_per 50
end
