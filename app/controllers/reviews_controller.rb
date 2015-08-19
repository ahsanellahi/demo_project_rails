class ReviewsController < ApplicationController
  before_filter :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :set_product
  before_filter :validate_before_destroy, only: :destroy

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
    return if @product.user == current_user
    @review = @product.reviews.new(params[:review])
    @review.user = current_user
    @review.save
    respond_to do |format|
      format.html { redirect_to @product}
      format.js
    end
  end

  def update
    @review.update_attributes(params[:review])
    respond_to do |format|
      format.html { redirect_to @product}
      format.js
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
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

    def validate_before_destroy
      return false unless current_user == @review.user || current_user == @product.user
    end
end
