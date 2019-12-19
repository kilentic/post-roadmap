class Post < ApplicationRecord
  validates :message, presence: true
  paginates_per 50
end
