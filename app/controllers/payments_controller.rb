class PaymentsController < ApplicationController
  def new
  end

  def create
    @amount = 99

    customer = Stripe::Customer.create({
      email: params[:email],
      source: params[:stripeToken],
      name: params[:name]
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    user = User.new({name:params[:name],email:params[:email],stripe_token:params[:stripeToken]})
    if user.save
      cookies[:stripe_token] = params[:stripeToken]
      redirect_to dashboard_view_path
    else
      redirect_to root_path
    end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  def success
  end

end
