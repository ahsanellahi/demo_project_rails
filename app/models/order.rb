class Order < ActiveRecord::Base
  attr_accessible :subtotal, :total

  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :user

  before_save :update_subtotal

  def subtotal
    self.products.collect{ |product| product.valid? ? product.price : 0 }.sum
  end

private
  def update_subtotal
    self[:subtotal] = subtotal
  end
end
