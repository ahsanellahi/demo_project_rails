class Product < ActiveRecord::Base
  PER_PAGE = 5
  attr_accessible :body, :price, :title, :images_attributes

  has_many :images, as: :imageable, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :title, :body, :price

  scope :ordered, order('created_at DESC')

  def reviews_count
    reviews.count
  end
end
