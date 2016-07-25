class ChargesController < ApplicationController

  AMOUNTS = {
    fifty: "5000",
    seventy_five: "7500",
    one_fifty: "15000",
    one_seventy_five: "17500"
  }.with_indifferent_access.freeze

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => AMOUNTS[params[:product]],
      :description => params[:product],
      :currency    => 'usd'
    )

    flash[:message] = "Payment Successfully Processed"
    redirect_to request.referrer

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
