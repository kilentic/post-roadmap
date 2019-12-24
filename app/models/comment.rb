class Comment < ApplicationRecord
  has_many :likes, as: :duty
  belongs_to :post
  belongs_to :user
end
