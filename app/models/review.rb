class Review < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true
  belongs_to :product
  belongs_to :user

  scope :ordered, order('created_at DESC')
end
