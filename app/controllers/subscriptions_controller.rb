class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def new
  end

  def create
    stripe_customer = Stripe::Customer.create(
      :source => params[:stripeToken],
      :plan => "platform_subscription",
      :email => current_user.email
    )

    current_user.update!(subscribed: true, stripe_id: stripe_customer.id)

    flash[:message] = "Payment Successfully Processed"
    redirect_to new_subscription_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_subscription_path
  end
end
