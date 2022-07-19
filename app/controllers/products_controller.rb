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
end
