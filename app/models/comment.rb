class Comment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username
  
  belongs_to :user
  validates :body, presence: true, length: {maximum: 2000}
end
