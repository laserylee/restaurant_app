class ChangePriceToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price, :decimal, precision: 12, scale: 3
  end
end
