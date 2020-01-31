class Friend < ApplicationRecord
  belongs_to :current, class_name: 'User'
  belongs_to :friend, class_name: 'User'
end
