module ProductsHelper
  def is_owner? user
    user == current_user
  end

  def is_owner_and_signed_in? user
    user_signed_in? && is_owner?(user)
  end
end
