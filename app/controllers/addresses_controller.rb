class AddressesController < ApplicationController
  def index
    if current_user.present?
      @addresses = current_user.addresses
    end
  end

  def show
    @addresses = current_user.addresses
    #@adress = Address.find(params[:id])  
  end

  def new
    @address = current_user.addresses.new 
  end

  def create
     @address = current_user.addresses.new(address_params)
    # @address = Address.new(address_params) 
    if @address.save   
      redirect_to root_path
    else   
      flash[:error] = 'Failed to edit address!'   
      render :new   
    end   
  end

  def edit
    @address = Address.find(params[:id])  
  end

  def update
    @address = Address.find(params[:id])   
    if @address.update_attributes(address_params)   
      flash[:notice] = 'Address updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit address!'   
      render :edit   
    end   
  end

  def destroy
    @address = Address.find(params[:id])   
    if @address.delete   
      flash[:notice] = 'Address deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this address!'   
      render :destroy   
    end   
  end

  private
  def address_params
    params.require(:address).permit(:name, :pincode, :address1, :address2, :user_id)
  end
end
