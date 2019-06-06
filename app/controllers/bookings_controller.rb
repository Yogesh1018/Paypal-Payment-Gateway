class BookingsController < ApplicationController

  before_action :find_ticket, only: [:new]

  def new
    @booking = Booking.new
  end

  def create
    @ticket = MovieTicket.find(params[:booking][:movie_ticket_id])
    @booking = Booking.new(permit_params)
    if @booking.save
      response = @booking.purchase
      if response.success?
        if @booking.update(success: true, message: response.message)
          flash[:success] = "Ticket Booked"
          redirect_to bookings_path(id: @booking.id)and return 

        else
          flash[:danger] = "Can't Process! Try again later"
        end
      else
        flash[:danger] = @booking.errors.full_messages.join(",")
      end
      redirect_to ticket_path and return   
    else
      flash.now[:danger] = @booking.errors.full_messages.join(",")
      render 'new'
    end
  end


  def show
    @booking = Booking.find(params[:id])
  end

  private

  def find_ticket
    @ticket = MovieTicket.find(params[:ticket_id])
  end

  def permit_params
    params.require(:booking).permit(:first_name, :last_name, :card_type, :card_expires_on, :card_number, :card_verification, :movie_ticket_id)
  end
end
