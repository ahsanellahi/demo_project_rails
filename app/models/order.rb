class Order < ActiveRecord::Base
  attr_accessible :subtotal, :total

  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :user

  after_save :update_subtotal
  after_save :update_total

  def subtotal
    self.products.collect{ |product| product.valid? ? product.price : 0 }.sum
  end

private
  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_total
    self[:total] = self[:subtotal]
  end
end
