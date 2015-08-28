class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_cart!

  def new
    @client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: current_order.subtotal,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.purchase_products!
      PaymentMailer.checkout_email(current_user, current_order).deliver
      redirect_to root_url, success: "Congraulations! Your transaction has been successfully!"
    else
      flash[:danger] = "Something went wrong while processing your transaction. Please try again!"
      @client_token = generate_client_token
      render :new
    end
  end

  private
    def check_cart!
      unless current_user.orders.where(purchased_at: nil).last.products.first
        redirect_to root_url, danger: "Please add some items to your cart before processing your transaction!"
      end
    end

    def generate_client_token
      Braintree::ClientToken.generate
    end
end
