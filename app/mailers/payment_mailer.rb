class PaymentMailer < ActionMailer::Base
  default from: "no-reply@shoppy.com"

  def checkout_email(user, order)
    @order_products = order.products
    @user = user
    mail(to: @user.email, subject: "Invoice: Shoppy")
  end

end
