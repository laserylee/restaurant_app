class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
    add_column :orders, :order_code, :string
    add_column :orders, :pickup_time, :datetime
  end
end
