module ReviewsHelper
  def review_owner? user
    user == current_user
  end

  def product_owner? user
    user == current_user
  end

  def display_time time
    "#{time_ago_in_words(time)} ago"
  end
end
