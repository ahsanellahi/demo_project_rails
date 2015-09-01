class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :product_owner, only: [:show]
  before_filter :authenticate_user!, except: [:show, :index]
  before_filter :authenticate_for_owner, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    if params[:query]
      @products = Product.search(params[:query], page: params[:page], per_page: Product::PER_PAGE, order: 'created_at DESC')
    else
      @products = Product.includes(:images, :user).ordered.page(params[:page]).per(Product::PER_PAGE)
    end
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
    flash[:success] = "Product created successfully!"
    respond_with(@product)
  end

  def update
    @product.update_attributes(params[:product])
    flash[:success] = "Product updated successfully!"
    respond_with(@product)
  end

  def destroy
    @product.destroy
    flash[:danger] = "Product destroyed successfully!"
    redirect_to users_dashboard_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_owner
      @owner = @product.user
    end

    def authenticate_for_owner
      redirect_to products_path unless valid_user?(product_owner)
    end
end
