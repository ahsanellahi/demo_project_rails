class Order < ActiveRecord::Base
  attr_accessible :subtotal, :total

  has_many :order_items
  has_many :products, through: :order_items
end
