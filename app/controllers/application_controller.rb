class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  # before_action :initialize_session
  # before_action :load_cart

  protect_from_forgery with: :exception
  before_action :set_cart

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end



   def current_cart
    if session[:cart_item_id]
      @current_cart ||= CartItem.find(session[:cart_item_id])
    end
    if session[:cart_item_id].nil?
    @current_cart = CartItem.create!
    session[:cart_item_id] = @current_cart.id
  end
  @current_cart
  end 
 

  # def initialize_session
  #   session[:cart] ||= []
  # end

  # def load_cart
  #   @cart = Product.find(session[:cart])
  # end

  # protect_from_forgery with: :exception

  before_action :current_cart_item

  private


    def current_cart_item
      if session[:cart_item_id]
        cart_item = CartItem.find_by(:id => session[:cart_item_id])
        if cart_item.present?
          @current_cart_item = cart_item
        else
          session[:cart_item_id] = nil
        end
      end

      if session[:cart_item_id] == nil
        @current_cart_item = CartItem.create
        session[:cart_item_id] = @current_cart_item.id
      end
    end

      

 
  private
 
  def set_cart
    @cart_item = CartItem.find(session[:cart_item_id])
    rescue ActiveRecord::RecordNotFound
    @cart_item= CartItem.create
    session[:cart_item_id] = @cart_item.id
  end


end
