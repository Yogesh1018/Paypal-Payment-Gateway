class AddColToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :amount, :integer
  end
end
