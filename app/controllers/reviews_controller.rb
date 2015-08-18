class ReviewsController < ApplicationController
  before_filter :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @product = Product.find(params[:id])
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(params[:review])
    @review.save
    respond_with(@product)
  end

  def update
    @review.update_attributes(params[:review])
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end
end
