class CartsController < ApplicationController
  def show
    @order_products = current_order.products
    @order_items = current_order.order_items
  end
end
