class User < ActiveRecord::Base
  PER_PAGE = 9
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :image_attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_one :image, as: :imageable, dependent: :destroy
  has_many :products
  has_many :reviews

  accepts_nested_attributes_for :image

  def get_image
    self.image || self.create_image
  end

  def get_default_image
    "/assets/original/default_profile_photo.png"
  end
end
