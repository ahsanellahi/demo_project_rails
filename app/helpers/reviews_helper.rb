module ReviewsHelper
  def review_owner? user
    user == current_user
  end

  def product_owner? user
    user == current_user
  end
end
