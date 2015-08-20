class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_accessible :photo
  has_attached_file :photo, styles:
                                    { medium: "300x300>",
                                      thumb: "100x100>"
                                    },
                                    default_url: "/assets/:style/default_profile_photo.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def get_image_url size
    self.photo.url(size)
  end
end
