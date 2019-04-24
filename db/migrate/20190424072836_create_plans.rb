class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :amount
      t.string :frequency
      t.integer :cycles
      t.string :period

      t.timestamps
    end
  end
end
