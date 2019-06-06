class BookingsController < ApplicationController

  before_action :find_ticket, only: [:new]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(permit_params)
    if @booking.save
      redirect_to ticket_path  
    else
      flash.now[:danger] = @booking.errors.full_messages.join(",")
      @ticket = MovieTicket.find(params[:booking][:movie_ticket_id])
      render 'new'
    end
  end

  private

  def find_ticket
    @ticket = MovieTicket.find(params[:ticket_id])
  end

  def permit_params
    params.require(:booking).permit(:first_name, :last_name, :card_type, :movie_ticket_id)
  end
end
