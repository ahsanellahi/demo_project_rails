class UsersController < ApplicationController
  def dashboard
    @user = User.includes(products: [:reviews, :images]).includes(reviews: [:product]).find(current_user.id)
    @reviews = @user.reviews
    @products = @user.products
  end

  def show
    @user = User.includes(products: [:reviews, :images]).find(params[:id])
    @products = @user.products
  end
end
