class ChangeColumnToNewFromCartItem < ActiveRecord::Migration[6.0]
  def change 
    change_column :cart_items, :Quantity, :integer
  end
end
