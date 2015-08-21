module ApplicationHelper

  def user_page user
    user == current_user ? users_dashboard_path : users_show_path(user)
  end

end
