class PostComment < ApplicationRecord
  belongs_to :admin
  belongs_to :post
  
  validates :comment, presence: true
end
