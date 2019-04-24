class BooksController < ApplicationController

  def index
    @books = Book.all
    # @order = Order.new
  end

end
