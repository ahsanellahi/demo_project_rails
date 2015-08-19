class UsersController < ApplicationController
  def dashboard
    @user = User.includes(products: [:reviews, :images]).includes(reviews: [:product]).find(params[:id])
    @reviews = @user.reviews
    @products = @user.products
  end
end
