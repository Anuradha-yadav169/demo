class ProductsController < ApplicationController  
  def index   
    @products = current_user.products 
  end

  def show   
    @product = Product.find(params[:id])   
  end     

  def new   
    @product = current_user.products.new   
  end   

  def create   
    @product = current_user.products.new(product_params) 
    if @product.save   
      flash[:notice] = 'Product added!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit product!'   
      render :new   
    end   
  end   
  
  def edit   
    @product = current_user.products.find(params[:id])   
  end   

  def update   
    @product = current_user.products.find(params[:id]) 
    if @product.update_attributes(product_params)   
      flash[:notice] = 'Product updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit product!'   
      render :edit   
    end   
  end   

  def destroy   
    @product = Product.find(params[:id])   
    if @product.delete   
      flash[:notice] = 'Product deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this product!'   
      render :destroy   
    end   
  end  

  private 

  def product_params   
    params.require(:product).permit(:name, :price, :description, :user_id, :image)   
  end 


  def add_to_cart_items
    if current_user.is_a?(GuestUser)    # Using petergate gem for the authorization, and GuestUser is a dummy user who is not logged in.
      respond_to do |format|
        format.js { render 'sign_in_to_continue' }
      end
    else
      @cart_item = CartItem.new(user_id: current_user.id, product_id: @product.id)

      respond_to do |format|
        if @cart_item.save
          format.js
        else
          format.js { render 'failed_saving_cart_item' }
        end
      end
    end
  end


end
