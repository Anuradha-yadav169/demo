class CartItemsController < ApplicationController
  # before_action :initialize_session
  # # before_action :load_cart
  # before_action :current_cart_item

 
#  def cart_item
#   id = params[:id].to_i
#   session[:cart_item] << id unless session[:cart_item].include?(id)
#   redirect_to products_path
#  end
#  # def remove_from_cart_item
#  #  id = params[:id].to_i
#  #  session[:cart_item].delete(id)
#  #  redirect_to products_path
#  # end

#   def create
#     byebug
#     @cart_item.add_product(params)
     
#     if @cart_item.save
#       redirect_to cart_item_path
#     else
#       flash[:error] = 'There was a problem adding this product to your cart.'
#       redirect_to @product
#     end
#   end

#   def show
#     @product =  Product.all 
#     #@cart_item = Product.find(session[:cart_item])
#     #@cart_item = @cart_item.add_product(params)
#     # @cart_item = CartItem.find(params[:id]) 
  
#   end

#   def destroy
#     @cart = @current_cart
#     @cart.destroy
#     session[:cart_id] = nil
#     redirect_to root_path
#   end

#   # private 

#   # def initialize_session
#   #   session[:cart_item] ||= []
#   # end

#   # def load_cart
#   #   @cart_item = Product.find(session[:cart_item])
#   # end


#    # before_action :current_cart_item


#    #  def current_cart_item
#    #    if session[:cart_item_id]
#    #      cart_item = CartItem.find_by(:id => session[:cart_item_id])
#    #      if cart_item.present?
#    #        @current_cart_item = cart_item
#    #      else
#    #        session[:cart_item_id] = nil
#    #      end
#    #    end

#    #    if session[:cart_item_id] == nil
#    #      @current_cart_item = CartItem.create
#    #      session[:cart_item_id] = @current_cart_item.id
#    #    end
#    #  end

#   private 

#   # def cart_params   
#   #   params.require(:cart_item).permit(:user_id, :product_id)   
#   # end 
# end











  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart_item, only: [:create]

  def index
    @cart_items = CartItem.all
  end

  def show
    @cart = current_cart
    #@cart_item = CartItem.find(params[:id])
    #@cart_item = CartItem.product_id.find_by_id(params[:id]) 

    # @cart_item = @cart_item.add_product(@product)
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def add_product(product_id)
    # product_id = Product.find(product_id)
    # item = CartItem.find_by(product_id: product_id)
    cart =  @cart_item = CartItem.all
    item = CartItem.where('product_id = ?', product_id)
    if item
        # increase the quantity of product in cart
        # item.Quantity + 1
        cart.Quantity+1

        # @cart_item.Quantity + 1
        save
    else
        # product does not exist in cart
        product = Product.find(product_id)
        items << product
    end
    save
  end

  # def create
  #   byebug
  #   @cart_item = @cart_item.add_product(cart_item_params)
  #   if @cart_item.save
  #     redirect_to cart_item_path
  #   else
  #     flash[:error] = 'There was a problem adding this item to your cart.'
  #     redirect_to @product
  #   end
  # end

  def create
    @product = Product.all
    # @cart_item = @cart_item.add_product(@product)
    @cart_item = add_product(@product)

    if @cart_item.save   
      redirect_to @cart_item
    else   
      flash[:error] = 'Failed to edit address!'   
      render @product  
    end   
  end

  def add_to_cart
  current_cart.add_product(params[:product_id])
  # redirect to shopping cart or whereever
  end

    def add_to_cart
      current_cart.add_product(params[:product_id])
      redirect_to cart_items_path(current_cart.id)
   end

  # def update
  #   respond_to do |format|
  #     if @line_item.update(line_item_params)
  #       format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # def destroy
  #   @line_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def set_cart_item
      @cart_item = CartItem.all
    end

    def cart_item_params
      params.permit(:product_id, :user_id)
    end
end