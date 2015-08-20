module ReviewsHelper
  def review_owner? user
    user == current_user
  end

  def product_owner? user
    user == current_user
  end

  def get_owner_email review
    review.user.email
  end

  def show_or_dashboard user
    return users_dashboard_path if user == current_user
    return users_show_path(user) unless user == current_user
  end
end
