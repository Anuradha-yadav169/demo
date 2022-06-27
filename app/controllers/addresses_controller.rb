class AddressesController < ApplicationController
  def index
    if current_user.present?
      #@addresses = current_user.addresses.find(params[:id]) 
      @addresses = current_user.addresses
    end

  end

  def show
    #@address = Address.find(params[:id])
    @address = current_user.addresses.find(params[:id])  
  end

  def new
    # @address = current_user.addresses.new 
    @address = Addresses.new 
  end

  def create
     #@address = current_user.addresses.new(address_params)
    @address = Address.new(address_params) 
    if @address.save   
      redirect_to root_path
    else   
      flash[:error] = 'Failed to edit address!'   
      render :new   
    end   
  end

  def edit
    @address = current_user.addresses.find(params[:id])  
    #@address = Address.find(params[:id])  
  end

  def update
    @address = current_user.addresses.find(params[:id])
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

  # def auth_user
  #   @address = Address.find_by(id: params[:id])
  #   unless params[:id].to_s == current_user.id.to_s
  #     redirect_to root_path
  #   end
  # end


  def address_params
    params.require(:address).permit(:name, :pincode, :address1, :address2, :user_id)
  end


  # def correct_user
  #   @address = Address.find_by(id: params[:id])  // find the post
  #   unless current_user?(@address.user)
  #     redirect_to user_path(current_user)
  #   end
  # end

end
