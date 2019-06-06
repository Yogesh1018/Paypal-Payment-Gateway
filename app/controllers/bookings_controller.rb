class BookingsController < ApplicationController

  before_action :find_ticket, only: [:new]

  def new
    @booking = Booking.new
  end

  def create
    redirect_to ticket_path  
  end

  private

  def find_ticket
    @ticket = MovieTicket.find(params[:ticket_id])
  end
end
