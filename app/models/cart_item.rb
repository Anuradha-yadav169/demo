class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def add_product(product)
  #   # current_item = line_items.find_by(instrument_id: instrument.id)
  #   current_item = CartItem.where('product_id = ?', product_id)

  #   if current_item
  #     puts "Hii"
  #   else
  #     current_item = CartItem.build(product_id: product.id)
  #   end
  #   current_item
  # end

  def add_product(product_id)
    item = CartItem.where('product_id = ?', product_id)
    if item
        # increase the quantity of product in cart
        item.quantity + 1
        save
    else
        # product does not exist in cart
        product = Product.find(product_id)
        items << product
    end
    save
  end
end
