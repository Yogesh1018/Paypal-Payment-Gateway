class OrdersController < ApplicationController

  before_action :find_book, only: [:index, :new, :recuring, :express]

  def express
    # plan = Plan.find(params[:plan_id]) if params[:plan_id]
    # order = plan.orders.build
    # order.book = @book
    response = EXPRESS_GATEWAY.setup_purchase(@book.price,
      :ip                => request.remote_ip,
      :return_url        => new_order_url(:plan_id => params[:plan_id], book_id: params[:book_id]),
      :cancel_return_url => orders_url
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  
  def recuring
    plan = Plan.find(params[:plan_id])
    order = plan.orders.build
    order.book = @book
    redirect_to order.checkout_url(
      return_url: new_order_url(:plan_id => params[:plan_id], book_id: params[:book_id]),
      cancel_url: root_url
    )
  end

  def index
    @plans = Plan.all
  end
  # GET /orders/new
  def new
    @order = Order.new(:express_token => params[:token])
    @order.amount = @book.price
    if params[:plan_id]
      @order.recuring = true
      @plan = Plan.find(params[:plan_id ])
    end
  end

  def show
    @order = Order.find(params[:id])
    @response= @order.transactions.last.message
  end

  # POST /orders
  # POST /orders.json
  def create
    plan = Plan.find(params[:order][:plan_id]) if params[:order][:plan_id]
    book = Book.find(params[:order][:book_id])
    @order = Order.new(order_params)
    @order.ip_address = request.remote_ip
    @order.amount = book.price
    if @order.save
      if @order.purchase
        flash[:success] = "Transactions successfull"
      else
        flash[:danger] = "Unsuccessfull Transactions try later..."
      end
        redirect_to order_path(@order)
    else
      flash[:danger] =  @order.errors.full_messages.join(', ')
      redirect_to get_error_path
    end
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def order_params
    params.require(:order).permit(:ip_address, :recuring, :amount, :first_name, :last_name, :card_type, :card_expires_on, :card_number, :card_verification, :express_token, :book_id, :plan_id)
  end

  def get_error_path
    if params[:order][:plan_id]
      new_order_path(book_id: params[:order][:book_id], plan_id: params[:order][:plan_id])
    else
      new_order_path(book_id: params[:order][:book_id])
    end
  end

end
