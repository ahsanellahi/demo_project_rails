class CartsController < ApplicationController

  before_filter :revert_discount!

  def show
    @order_products = current_order.products
    @order_items = current_order.order_items
  end

  def revert_discount!
    current_order[:total] = current_order[:subtotal]
  end
end
