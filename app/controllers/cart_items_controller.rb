class CartItemsController < ApplicationController
  def index
    byebug
    #@cart_items = CartItem.all
    @cart_items = current_user.cart_items
  end

  def show
    @cart_item = CartItem.find_by_product_id(params[:id])
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def add_product(product_id, user_id)
    cart = CartItem.find_by_product_id(product_id)
    if cart
        cart.Quantity+1
        # save
    else
        user_id = current_user.cart_items
        cart = current_user.cart_items.create(product_id: product_id, Quantity: 1, user_id: user_id)
    end
    cart
  end

  def create
    @cart_item = add_product(params[:product_id], [:user_id])
    if @cart_item.save   
      redirect_to cart_items_path
    else   
      flash[:error] = 'Failed to create!'   
      redirect_to @new
    end   
  end

  def destroy 
    @cart_item = CartItem.find_by_product_id(params[:id])
    if @cart_item.destroy
      redirect_to products_path
    end   
  end 
 
  private
  def set_cart_item
    @cart_item = CartItem.all
  end

  def cart_item_params
    params.permit(:product_id, :user_id, :Quantity)
  end
end
