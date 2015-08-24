module ProductsHelper
  def is_owner? user
    user == current_user
  end

  def is_owner_and_signed_in? user
    user_signed_in? && is_owner?(user)
  end

  def is_owner_or_not_signed_in? user
    !(user_signed_in?) || is_owner?(user)
  end

  def get_product_image_url image, size
    image ? image.get_image_url(size) : 'default-image.png'
  end
end
