class ReviewsController < ApplicationController
  before_filter :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :set_product
  before_filter :validate_before_destroy, only: :destroy
  before_filter :validate_before_create, only: :create

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = @product.reviews.new(params[:review])
    @review.user = current_user
    @review.save
    respond_to do |format|
      flash.now[:success] = "Review created successfully!"
      format.html { redirect_to @product}
      format.js
    end
  end

  def update
    @review.update_attributes(params[:review])
    respond_to do |format|
      flash.now[:success] = "Review updated successfully!"
      format.html { redirect_to @product}
      format.js
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      flash.now[:danger] = "Review destroyed successfully!"
      format.html { redirect_to @product}
      format.js
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def validate_before_create
      redirect_to @product if valid_user?(@product.user)
    end

    def validate_before_destroy
      redirect_to @product unless valid_user?(@product.user) || valid_user?(@review.user)
    end
end
