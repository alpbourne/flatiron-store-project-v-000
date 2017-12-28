class LineItemsController < ApplicationController
  before_action :current_cart

  def create
    if current_user
      if @current_cart
        @cart.add_item(params[:item_id]).save
      else
        @cart = Cart.create(user_id: current_user.id)
        @cart.add_item(params[:item_id]).save
      end
      redirect_to store_path
    else
      redirect_to store_path
    end
  end

private

  # def line_item_params
  #   params.require(:item_id).permit(:item_id)
  # end


  def current_cart
    @current_cart = current_user.current_cart
  end
end
