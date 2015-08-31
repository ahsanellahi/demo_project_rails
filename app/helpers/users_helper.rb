module UsersHelper
  def get_user_image_url user
    user.image ? user.image.photo.url(:thumb) : 'thumb/default_profile_photo.png'
  end
end
