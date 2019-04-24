class AddBookrefToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :book_id, :integer
  end
end
