class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end

  before_action :current_cart_item

  # private
  #   def current_cart_item
  #     if session[:cart_item_id]
  #       cart_item = CartItem.find_by(:id => session[:cart_item_id])
  #       if cart_item.present?
  #         @current_cart_item = cart_item
  #       else
  #         session[:cart_item_id] = nil
  #       end
  #     end

  #     if session[:cart_item_id] == nil
  #       @current_cart_item = CartItem.create
  #       session[:cart_item_id] = @current_cart_item.id
  #     end
  #   end

  def current_cart_item
    if session[:cart_item_id]
    @current_cart_item ||= CartItem.find(session[:cart_item_id])
  end
  # if session[:cart_items_id].nil?
  #   @current_cart_item = CartItem.create!
  #   session[:cart_items_id] = @current_cart_item.id
  # end
  # @current_cart_item
 end 

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :user_id)
  end


end
