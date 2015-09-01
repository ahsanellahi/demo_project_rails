class Product < ActiveRecord::Base
  PER_PAGE = 9
  attr_accessible :body, :price, :title, :images_attributes

  has_many :images, as: :imageable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  belongs_to :user

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :title, :body, :price
  validates :price, numericality: { greater_than: 0 }

  scope :ordered, order('created_at DESC')

  define_index  do
    set_property delta: true

    indexes title
    indexes body

    has created_at
  end

  def reviews_count
    reviews.count
  end
end
