class ProductsController < ApplicationController
  before_filter :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :product_owner, only: [:show]

  respond_to :html

  def index
    @products = Product.ordered.page(params[:page]).per(Product::PER_PAGE)
    respond_with(@products)
  end

  def show
    @reviews = @product.reviews
    @review = Review.new
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
end
