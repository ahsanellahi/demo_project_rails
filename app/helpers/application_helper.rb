module ApplicationHelper
  def valid_user? user
    user == current_user
  end

  def user_page user
    user == current_user ? users_dashboard_path : users_show_path(user)
  end

  def user_full_name user
    [user.first_name, user.last_name].join(' ')
  end

  def apply_discount order
    order[:total] = (order[:subtotal] * 0.9).ceil
    order.save
    order[:total]
  end

  def current_order_has_products?
    current_order.products.first
  end
end
