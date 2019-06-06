class CreateMovieTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_tickets do |t|
      t.decimal :price
      t.string :title
      t.timestamps
    end
  end
end
