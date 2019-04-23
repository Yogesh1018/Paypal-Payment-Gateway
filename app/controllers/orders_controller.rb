class OrdersController < ApplicationController

  def express
    response = EXPRESS_GATEWAY.setup_purchase(800,
      :ip                => request.remote_ip,
      :return_url        => new_order_url,
      :cancel_return_url => orders_url
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  # GET /orders/new
  def new
    @order = Order.new(:express_token => params[:token])
  end

  # POST /orders
  # POST /orders.json
  def create  
    @order = Order.new(order_params)
    @order.ip_address = request.remote_ip
    @order.amount = 800
    if @order.save
      if @order.purchase
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end

  def order_params
    params.require(:order).permit(:ip_address, :first_name, :last_name, :card_type, :card_expires_on, :card_number, :card_verification)
  end

end
