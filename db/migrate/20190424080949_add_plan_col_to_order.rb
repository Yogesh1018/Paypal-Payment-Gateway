class AddPlanColToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :plan_id, :integer
  end
end
