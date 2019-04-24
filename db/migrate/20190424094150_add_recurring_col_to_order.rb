class AddRecurringColToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :recuring, :boolean, default: false
  end
end
