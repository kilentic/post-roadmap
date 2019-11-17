class Post < ApplicationRecord
  validates :message, presence: true, length: {  maximum: 255 }
  paginates_per 50
end
