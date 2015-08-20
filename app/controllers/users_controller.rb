class UsersController < ApplicationController
  def dashboard
    @user = User.includes(products: [:reviews, :images]).includes(reviews: [:product]).find(current_user.id)
    @reviews = @user.reviews.ordered.page(params[:review_page_number]).per(User::PER_PAGE)
    @products = @user.products.ordered.page(params[:product_page_number]).per(User::PER_PAGE)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @user = User.includes(products: [:reviews, :images]).find(params[:id])
    @products = @user.products.ordered.page(params[:product_page_number]).per(User::PER_PAGE)
  end
end
