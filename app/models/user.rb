class User < ActiveRecord::Base
  PER_PAGE = 3
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :image_attributes, :first_name, :last_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  # Setup accessible (or protected) attributes for your model
  has_one :image, as: :imageable, dependent: :destroy
  has_many :products
  has_many :reviews
  has_many :orders

  validates_presence_of :first_name, :last_name
  validates_length_of :first_name, :last_name, maximum: 30

  accepts_nested_attributes_for :image

  def get_image
    self.image || self.create_image
  end

  def get_default_image
    "/assets/original/default_profile_photo.png"
  end

  def purchase_products!
    @order = self.orders.where(purchased_at: nil).last
    @order.purchased_at = Time.now
    @order.save
  end
end
