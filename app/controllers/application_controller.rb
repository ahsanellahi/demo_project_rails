class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_order

  def current_order
    if session[:order_id]
      @current_order ||= Order.find(session[:order_id])
      session[:order_id] = nil if @current_order.purchased_at
    else
      @current_order = Order.create!
      session[:order_id] = @current_order.id
    end

    if user_signed_in?
      @current_order.user_id = current_user.id
    end
    @current_order
  end

  def valid_user? user
    user == current_user
  end
end
