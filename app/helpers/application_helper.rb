module ApplicationHelper

  def user_page user
    user == current_user ? users_dashboard_path : users_show_path(user)
  end

  def user_full_name user
    [user.first_name, user.last_name].join(' ')
  end

  def display_price price
    ['Rs.', price].join(' ')
  end
end
