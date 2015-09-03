class UsersController < ApplicationController
  before_filter :authenticate_user!, only: :dashboard

  def dashboard
    @user = current_user
    @reviews = @user.reviews.includes(:product).ordered.page(params[:review_page_number]).per(User::PER_PAGE)
    @products = @user.products.includes(:reviews, :images).ordered.page(params[:product_page_number]).per(User::PER_PAGE)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products.includes(:reviews, :images).ordered.page(params[:product_page_number]).per(User::PER_PAGE)
  end
end
