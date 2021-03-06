class OrdersController < ApplicationController
  def new
    @pop = Pop.find(params[:pop_id])

    Stripe.api_key = ENV['STRIPE_SK_TEST']
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: order_success_url,
      cancel_url: order_cancel_url,
      line_items: [
        {
          name: @pop.name,
          description: "sold by #{@pop.user.email}",
          amount: (@pop.price * 100.00).to_i,
          currency: 'aud',
          quantity: 1
        }
      ]
      
    )
  end

  def success
    render html: "<h4>Thanks for your order!</h4>".html_safe
  end

  def cancel
    render html: "<h4>The order was cancelled.</h4>".html_safe
  end
end