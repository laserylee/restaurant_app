class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_code, unique:true
      t.string :item_list
      t.string :item_quantity
      t.datetime :pickup_time
      t.boolean :picked_up, default:false
      t.float :price

      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :orders, [:user_id, :pickup_time]
  end
end
