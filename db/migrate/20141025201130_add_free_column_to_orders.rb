class AddFreeColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :free, :boolean
  end
end
