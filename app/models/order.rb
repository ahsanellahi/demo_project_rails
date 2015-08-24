class Order < ActiveRecord::Base
  attr_accessible :subtotal, :total

  has_many :order_items
  has_many :products, through: :order_items

  before_save :update_subtotal

  def subtotal
    self.products.collect{ |product| product.valid? ? product.price : 0 }.sum
  end

private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
