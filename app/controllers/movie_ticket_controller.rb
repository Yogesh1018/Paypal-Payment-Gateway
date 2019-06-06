class MovieTicketController < ApplicationController

  def index
    @tickets = MovieTicket.all
  end
  
end
