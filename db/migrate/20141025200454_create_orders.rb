class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :party_id
      t.integer :food_id
      t.timestamps
    end
  end
end
