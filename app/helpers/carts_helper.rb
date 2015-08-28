module CartsHelper
  def user_signed_in_and_has_order?
  user_signed_in? && current_user.orders.where(purchased_at: nil).last.products.first
  end

  def has_order?
    current_order.products.first
  end
end
