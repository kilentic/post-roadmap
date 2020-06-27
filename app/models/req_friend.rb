class ReqFriend < ApplicationRecord
  belongs_to :req_user, class_name: 'User', optional: true
  belongs_to :res_user, class_name: 'User', optional: true
end
