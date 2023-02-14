class PaymentsController < ApplicationController
  def new
  end

  def create
    @amount = 99
  payment_method = Stripe::PaymentMethod.create({
    type: 'card',
    card: {
      token: params[:stripeToken]
    }
  })


  payment_intent = Stripe::PaymentIntent.create({
    amount: @amount,
    currency: 'USD',
    payment_method_types: ['card'],
    payment_method: payment_method.id,
    confirm: true,
    use_stripe_sdk: true,
    setup_future_usage: 'off_session'
  })

  if payment_intent.status == 'requires_action'
      authentication_url = payment_intent.next_action.use_stripe_sdk.stripe_js
      user = User.new({name:params[:name],email:params[:email],stripe_token:params[:stripeToken]})
      if user.save
        cookies[:stripe_token] = params[:stripeToken]
        redirect_to authentication_url, allow_other_host: true
      else
        redirect_to root_path
      end
   else
      user = User.new({name:params[:name],email:params[:email],stripe_token:params[:stripeToken]})
      if user.save
        cookies[:stripe_token] = params[:stripeToken]
          redirect_to dashboard_view_path
        else
          redirect_to root_path
      end
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  def success
  end

end
