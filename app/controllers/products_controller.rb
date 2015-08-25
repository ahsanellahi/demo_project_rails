class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :product_owner, only: [:show]
  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :authenticate_for_owner, except: [:show, :index, :new, :create]

  respond_to :html

  def index
    @products = Product.includes(:images, :user).ordered.page(params[:page]).per(Product::PER_PAGE)
    @order_item = current_order.order_items.new
    respond_with(@products)
  end

  def show
    @images = @product.images
    @reviews = @product.reviews
    @review = Review.new
    @order_item = current_order.order_items.new
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])
    @product.user = current_user
    @product.save
    respond_with(@product)
  end

  def update
    @product.update_attributes(params[:product])
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_owner
      @owner = @product.user
    end

    def authenticate_for_owner
      redirect_to products_path unless current_user == product_owner
    end
end
