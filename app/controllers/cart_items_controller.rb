class CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items
  end

  # def show
  #   @cart_item = CartItem.find(params[:id]) 
  # end

  # def new
  #   @cart_item = current_user.cart_items.new 
  # end

  # def create
  #   @cart_item = current_user.cart_items.new(cart_item_params)
  #   if @cart_item.save   
  #     redirect_to root_path
  #   else   
  #     flash[:error] = 'Failed to edit cart_item!'   
  #     render :new   
  #   end   
  # end

  # def edit
  #   @cart_item = current_user.cart_items.find(params[:id])   
  # end

  # def update
  #   @cart_item = current_user.cart_items.find(params[:id])
  #   if @cart_item.update_attributes(cart_item_params)   
  #     flash[:notice] = 'Address updated!'   
  #     redirect_to root_path   
  #   else   
  #     flash[:error] = 'Failed to edit!'   
  #     render :edit   
  #   end   
  # end

  #  def destroy
  #   @cart_item = CartItem.find(params[:id])   
  #   if @cart_item.delete   
  #     flash[:notice] = 'deleted!'   
  #     redirect_to root_path   
  #   else   
  #     flash[:error] = 'Failed to delete!'   
  #     render :destroy   
  #   end   
  # end

  # private

  # def cart_item_params
  #   params.require(:cart_item).permit(:product_id, :user_id)
  # end


def show
  @cart_item = current_cart_item
end

def add_to_cart
  current_cart_item.add_product(params[:product_id])
  redirect_to cart_items_path(current_cart_item.id)
end
# def add_to_cart
#   current_cart.add_item(params[:product_id])
#   # redirect to shopping cart or whereever
# end


 private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :user_id)
  end







  # def show
  #   @cart_item = @current_cart_item
  #   @cart_item = CartItem.find(params[:id]) 
  # end

  # def destroy
  #   @cart_item = @current_cart_item
  #   @cart_item.destroy
  #   session[:cart_item_id] = nil
  #   redirect_to root_path
  # end
end
