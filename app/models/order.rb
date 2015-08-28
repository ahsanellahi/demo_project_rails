class Order < ActiveRecord::Base
  attr_accessible :subtotal, :total

  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :user

  def calculate_subtotal
    self.products.collect{ |product| product.valid? ? product.price : 0 }.sum
  end

  def update_order_totals
    self[:total] = self[:subtotal] = calculate_subtotal
    self.save
  end

end
